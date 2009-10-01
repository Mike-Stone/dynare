/*
 * Defines the prototypes for BLAS Fortran functions.
 *
 * Also defines a typedef blas_int to be used for all integers passed to BLAS
 * functions.
 *
 * When used in the context of a MATLAB MEX file, you must define MATLAB_MEX_FILE
 * and MATLAB_VERSION (for version 7.4, define it to 0x0704).
 *
 *
 * Copyright (C) 2009 Dynare Team
 *
 * This file is part of Dynare.
 *
 * Dynare is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Dynare is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Dynare.  If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef _DYNBLAS_H
#define _DYNBLAS_H

/* Starting from version 7.8, MATLAB BLAS expects ptrdiff_t arguments for integers */
# if defined(MATLAB_MEX_FILE) && MATLAB_VERSION >= 0x0708
#  ifdef __cplusplus
#   include <cstdlib>
#  else
#   include <stdlib.h>
#  endif
typedef ptrdiff_t blas_int;
# else
typedef int blas_int;
# endif

# if defined(MATLAB_MEX_FILE) && defined(_WIN32)
#  define FORTRAN_WRAPPER(x) x
# else
#  define FORTRAN_WRAPPER(x) x ## _
# endif

# ifdef __cplusplus
extern "C" {
# endif

  typedef const char *BLCHAR;
  typedef const blas_int *CONST_BLINT;
  typedef const double *CONST_BLDOU;
  typedef double *BLDOU;

# define dgemm FORTRAN_WRAPPER(dgemm)
  void dgemm(BLCHAR transa, BLCHAR transb, CONST_BLINT m, CONST_BLINT n,
             CONST_BLINT k, CONST_BLDOU alpha, CONST_BLDOU a, CONST_BLINT lda,
             CONST_BLDOU b, CONST_BLINT ldb, CONST_BLDOU beta,
             BLDOU c, CONST_BLINT ldc);

# define dgemv FORTRAN_WRAPPER(dgemv)
  void dgemv(BLCHAR trans, CONST_BLINT m, CONST_BLINT n, CONST_BLDOU alpha,
             CONST_BLDOU a, CONST_BLINT lda, CONST_BLDOU x, CONST_BLINT incx,
             CONST_BLDOU beta, BLDOU y, CONST_BLINT incy);

# define dtrsv FORTRAN_WRAPPER(dtrsv)
  void dtrsv(BLCHAR uplo, BLCHAR trans, BLCHAR diag, CONST_BLINT n,
             CONST_BLDOU a, CONST_BLINT lda, BLDOU x, CONST_BLINT incx);

# define dtrmv FORTRAN_WRAPPER(dtrmv)
  void dtrmv(BLCHAR uplo, BLCHAR trans, BLCHAR diag, CONST_BLINT n,
             CONST_BLDOU a, CONST_BLINT lda, BLDOU x, CONST_BLINT incx);

# define daxpy FORTRAN_WRAPPER(daxpy)
  void daxpy(CONST_BLINT n, CONST_BLDOU a, CONST_BLDOU x, CONST_BLINT incx,
             BLDOU y, CONST_BLINT incy);

# define dcopy FORTRAN_WRAPPER(dcopy)
  void dcopy(CONST_BLINT n, CONST_BLDOU x, CONST_BLINT incx,
             BLDOU y, CONST_BLINT incy);

# define zaxpy FORTRAN_WRAPPER(zaxpy)
  void zaxpy(CONST_BLINT n, CONST_BLDOU a, CONST_BLDOU x, CONST_BLINT incx,
             BLDOU y, CONST_BLINT incy);

# define dscal FORTRAN_WRAPPER(dscal)
  void dscal(CONST_BLINT n, CONST_BLDOU a, BLDOU x, CONST_BLINT incx);

# define dtrsm FORTRAN_WRAPPER(dtrsm)
  void dtrsm(BLCHAR side, BLCHAR uplo, BLCHAR transa, BLCHAR diag, CONST_BLINT m,
             CONST_BLINT n, CONST_BLDOU alpha, CONST_BLDOU a, CONST_BLINT lda,
             BLDOU b, CONST_BLINT ldb);

# define ddot FORTRAN_WRAPPER(ddot)
  double ddot(CONST_BLINT n, CONST_BLDOU x, CONST_BLINT incx, CONST_BLDOU y,
              CONST_BLINT incy);

# ifdef __cplusplus
} /* extern "C" */
# endif

#endif /* _DYNBLAS_H */
