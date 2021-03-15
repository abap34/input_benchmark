const lines=readlines()
input()=popfirst!(lines)
int(s)=parse(Int,s)
ints(s)=map(x->parse(Int,x),split(s))


function main()
    N = int(input())
    A = ints(input())
end


function read_manyline()
    N = int(input())
    for i in 1:N
        A = int(input())
    end
end

main()