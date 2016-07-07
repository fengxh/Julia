
#include "qpOASES_e.h"

/** Example for qpOASES main function using the QProblem class. */
double qpOASES(double* H,
               double* g,
               double* A,
               double* lb,
               double* ub,
               double* lbA,
               double* ubA,
               double* xOpt,
               double* yOpt,
               int     nV,
               int     nC
               )
{
    USING_NAMESPACE_QPOASES
    
    /* Setting up QProblem object. */
    static Options options;
    static QProblem example;
    
    int nWSR;
    //double xOpt[nV];
    double fval;
    
    QProblemCON( &example, nV, nC, HST_UNKNOWN );
    Options_setToDefault( &options );
    QProblem_setOptions( &example,options );
    
    /* Solve QP. */
    nWSR = 10000;
    QProblem_init( &example,H,g,A,lb,ub,lbA,ubA,&nWSR,0 );
    
    /* Get and print solution of first QP. */
    QProblem_getPrimalSolution( &example,xOpt );
    QProblem_getDualSolution( &example,yOpt );
    
    //for(int i = 0; i < nV; i++) {
    //    printf("%d %e\n", i+1, xOpt[i]);
    //}
    
    fval = QProblem_getObjVal( &example );
    
    //printf("%e\n", fval);
    
    return fval;
}


/*
 *	end of file
 */
