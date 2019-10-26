using GPJ, Test, Random, PyCall

Random.seed!(123)


@testset "Models" begin
    @testset "GPR" begin
        kern= gpflow.kernels.Matern52(2)
        gpr = gpflow.models.GPR(randn(100,2), randn(100,1), kern;)
        @test typeof(gpr)<:gpflow.models.GPR
        @test typeof(gpr)<:gpflow.Model
        @test typeof(gpr.o)<:PyObject
        @test typeof(gpr.kern.o)<:PyObject

    end

    @testset "VGP" begin
        kern= gpflow.kernels.Matern52(2)
        like = gpflow.likelihoods.Gaussian()
        vgp = gpflow.models.VGP(randn(100,2), randn(100,1), kern, like)
        @test typeof(vgp)<:gpflow.models.VGP
        @test typeof(vgp)<:gpflow.Model
        @test typeof(vgp.o)<:PyObject
        @test typeof(vgp.kern.o)<:PyObject
        @test typeof(vgp.likelihood.o)<:PyObject
    end

end