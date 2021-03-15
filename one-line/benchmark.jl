using Plots
using BenchmarkTools

include("generate_input.jl")


function read_each()
    pipeline(`julia eachline.jl`, stdin="input.txt")
end


function read_popfirst()
    pipeline(`julia popfirst.jl`, stdin="input.txt")
end

function main(N)
    times_each = [1 1]
    times_pop = [1 1]

    input_sizes = [10^i for i in 1:N]

    for size in input_sizes
        println("benchmark size:$size")
        generate(size)
        benchmark = @benchmark read_each()
        times_each = vcat(times_each, hcat([fill(size, length(benchmark.times)), benchmark.times]...))
        println("each: $(benchmark)")
        benchmark = @benchmark read_popfirst()
        times_pop = vcat(times_pop, hcat([fill(size, length(benchmark.times)), benchmark.times]...))
        println("pop: $(benchmark)")
    end
    sc = scatter(times_each[:, 1], times_each[:, 2], label=["eachline"])
    xaxis!("input size", :log10)
    yaxis!("time[ns]", :log10)
    scatter!(times_pop[:, 1], times_pop[:, 2],label=["popfirst"])
    savefig(sc, "benchmark.png")
end

main(8)
