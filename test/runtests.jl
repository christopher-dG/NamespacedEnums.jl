using NamespacedEnums
using Test

@testset "NamespacedEnums.jl" begin
    @eval begin
        @nsenum A a b c
        @test A isa Module
        @test :T in names(A; all=true)
        @test A.T <: Enum
        for v in (:a, :b, :c)
            @test getfield(A, v) isa A.T
        end

        @nsenum T=Name B a=1 b=2 c=3
        @test !(:T in names(B; all=true))
        @test :Name in names(B; all=true)
        @test B.Name <: Enum
        @test Int(B.a) == 1

        @nsenum C::UInt8 begin
            a
            b
            c
        end
        @test C.T <: Enum{UInt8}
        @test :a in names(C; all=true)
    end
end
