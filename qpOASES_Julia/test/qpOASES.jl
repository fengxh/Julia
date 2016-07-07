#----------- QP Solver Interface -----------#
#----------- min (1/2)x'Hx + g'x -----------#
#----------- s.t. lb  <=  x <= ub ----------#
#---------------- lbA <= Ax <= ubA ---------#
#------------ Author Xuhui Feng ------------#
#------------- Date 11/20/2015 -------------#

function QPOASES_JULIA( H::Array{Float64},         # Hessian matrix
                        g::Array{Float64},         # Gradient vector
                        A::Array,                  # Constraint matrix
                        lb::Array,                 # Lower bound vector (on variables)
                        ub::Array,                 # Upper bound vector (on variables)
                        lbA::Array,                # Lower constraints' bound vector
                        ubA::Array,                # Upper constraints' bound vector
                        xOpt::Array{Float64},      # Primal solution
                        yOpt::Array{Float64},      # Dual solution
                        nV::Int64,                 # Number of variables
                        nC::Int64                  # Number of constraints
                      )
    H = vec(H);

    if A == []
        A = C_NULL;
    else
        A = vec(A');
    end


    if lb == []
        lb = C_NULL;
    end

    if ub == []
        ub = C_NULL;
    end

    if lbA == []
        lbA = C_NULL;
    end

    if ubA == []
        ubA = C_NULL;
    end

    fval = ccall((:qpOASES, "/Users/oII-V_V-IIo/Documents/ShanghaiTech/seminar/Houska‘s group/work/qpOASES\_Julia/build/lib/libqpOASES.dylib"),
                 (Float64),
                 (Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Int64, Int64),
    H, g, A, lb, ub, lbA, ubA, xOpt, yOpt, nV, nC);

    return fval;
end
