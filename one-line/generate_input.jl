using Random

function generate(N) 
    open("input.txt", "w") do f
        println(f, N)
        for a in rand(Int, N)
            print(f, "$a ")
        end
    end
end


function generate_manyline(N)
    open("input.txt", "w") do f
        println(f, N)
        for a in rand(Int, N)
            println(f, "$a ")
        end
    end
end