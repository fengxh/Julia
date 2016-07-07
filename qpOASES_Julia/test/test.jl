include("qpOASES.jl")

H   = [ 1.0 0.0 0.0 0.0; 0.0 0.5 0.0 0.0; 0.0 0.0 2.0 0.0; 0.0 0.0 0.0 3.0 ];
A   = [ 1.0 2.0 1.5 1.0; 1.5 2.0 1.0 0.5; 0.5 1.0 1.0 2.0 ];
g   = [ 1.5 1.0 1.0 2.0 ];
lbA = [ -1.0 -0.5 -1.0 ];
ubA = [ 2.0 2.5 1.5 ];
lb  = [ -0.5 -0.5 -0.5 -0.5];
ub  = [ 0.3 0.3 0.3 0.3];

nV = size(H, 1);
nC = size(A, 1);

xopt = Array{Float64}(nV, 1);
yopt = Array{Float64}(nV+nC, 1);

# case 1:
fval = QPOASES_JULIA(H, g, A, [], ub, lbA, ubA, xopt, yopt, nV, nC);

# case 2:
# fval = QPOASES_JULIA(H, g, A, [], [], lbA, [], xopt, yopt, nV, nC);

# case 3:
# nC = 0;
# yopt = Array{Float64}(nV+nC, 1);
# fval = QPOASES_JULIA(H, g, [], [], [], [], [], xopt, yopt, nV, nC);

println("xopt = ", xopt);
println("yopt = ", yopt);
println("fval = ", fval);
