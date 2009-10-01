% Build file for Dynare MEX Librairies for Octave

% Copyright (C) 2008-2009 Dynare Team
%
% This file is part of Dynare.
%
% Dynare is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% Dynare is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with Dynare.  If not, see <http://www.gnu.org/licenses/>.

COMPILE_OPTIONS = '-DOCTAVE_MEX_FILE';

% Comment next line to suppress compilation debugging info
COMPILE_OPTIONS = [ COMPILE_OPTIONS ' -v' ];

COMPILE_COMMAND = [ 'mex ' COMPILE_OPTIONS ];

disp('Compiling mjdgges...')
eval([ COMPILE_COMMAND ' -I. mjdgges/mjdgges.c -o ../octave/mjdgges.mex']);
disp('Compiling sparse_hessian_times_B_kronecker_C...')
eval([ COMPILE_COMMAND ' -I. kronecker/sparse_hessian_times_B_kronecker_C.cc -o ../octave/sparse_hessian_times_B_kronecker_C.mex']);
disp('Compiling A_times_B_kronecker_C...')
eval([ COMPILE_COMMAND ' -I. kronecker/A_times_B_kronecker_C.cc -o ../octave/A_times_B_kronecker_C.mex']);
disp('Compiling gensylv...')
eval([ COMPILE_COMMAND ' -I. -I../../dynare++/sylv/cc ' ...
       '../../dynare++/sylv/matlab/gensylv.cpp ' ...
       '../../dynare++/sylv/cc/BlockDiagonal.cpp ' ... 
       '../../dynare++/sylv/cc/GeneralMatrix.cpp ' ...
       '../../dynare++/sylv/cc/GeneralSylvester.cpp ' ...
       '../../dynare++/sylv/cc/IterativeSylvester.cpp ' ...
       '../../dynare++/sylv/cc/KronUtils.cpp ' ...
       '../../dynare++/sylv/cc/KronVector.cpp ' ...
       '../../dynare++/sylv/cc/QuasiTriangular.cpp ' ...
       '../../dynare++/sylv/cc/QuasiTriangularZero.cpp ' ...
       '../../dynare++/sylv/cc/SchurDecomp.cpp ' ...
       '../../dynare++/sylv/cc/SchurDecompEig.cpp ' ...
       '../../dynare++/sylv/cc/SimilarityDecomp.cpp ' ...
       '../../dynare++/sylv/cc/SylvException.cpp ' ...
       '../../dynare++/sylv/cc/SylvMatrix.cpp ' ...
       '../../dynare++/sylv/cc/SylvMemory.cpp ' ...
       '../../dynare++/sylv/cc/SylvParams.cpp ' ...
       '../../dynare++/sylv/cc/TriangularSylvester.cpp ' ...
       '../../dynare++/sylv/cc/Vector.cpp ' ...
       '-o ../octave/gensylv.mex']);
disp('Compiling bytecode...')
eval([ COMPILE_COMMAND ' -Ibytecode -I../../preprocessor bytecode/bytecode.cc bytecode/Interpreter.cc bytecode/Mem_Mngr.cc bytecode/SparseMatrix.cc -o ../octave/bytecode.mex']);
