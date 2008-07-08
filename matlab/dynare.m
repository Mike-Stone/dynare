function dynare(fname, varargin)
%	This command runs dynare with specified model file in argument
% 	Filename.
%	The name of model file begins with an alphabetic character, 
%	and has a filename extension of .mod or .dyn.
%	When extension is omitted, a model file with .mod extension
%	is processed.
%
% INPUTS
%   fname:      file name
%   varargin:   list of arguments following fname
%             
% OUTPUTS
%   none
%        
% SPECIAL REQUIREMENTS
%   none
%  
% part of DYNARE, copyright Dynare Team (2001-2008)
% Gnu Public License.

warning_config

if exist('OCTAVE_VERSION')
  if octave_ver_less_than('3.0.0')
    warning('This version of Dynare has only been tested on Octave 3.0.0 and above. Since your Octave version is older than that, Dynare may fail to run, or give unexpected results. Consider upgrading your Octave installation.');
  end
else
  if matlab_ver_less_than('6.5')
    warning('This version of Dynare has only been tested on Matlab 6.5 and above. Since your Matlab version is older than that, Dynare may fail to run, or give unexpected results. Consider upgrading your Matlab installation (or switch to Octave).');
  end
end

if nargin < 1
  error('You must provide the name of the MOD file in argument');
end

% disable output paging (it is on by default on Octave)
more off

% sets default format for save() command
if exist('OCTAVE_VERSION')
  default_save_options('-mat')
end

if ~ischar(fname)
  error ('The argument in DYNARE must be a text string.') ;
end

dynareroot = dynare_config();

% Testing if file have extension
% If no extension defalut .mod is added
if isempty(strfind(fname,'.'))
  fname1 = [fname '.dyn'];
  d = dir(fname1);
  if length(d) == 0
    fname1 = [fname '.mod'];
  end
  fname = fname1;
  % Checking file extension
else
  if ~strcmp(upper(fname(size(fname,2)-3:size(fname,2))),'.MOD') ...
	&& ~strcmp(upper(fname(size(fname,2)-3:size(fname,2))),'.DYN')
    error ('Argument is a file name with .mod or .dyn extension');
  end;
end;
d = dir(fname);
if length(d) == 0
  disp(['DYNARE: can''t open ' fname])
  return
end

command = ['"' dynareroot 'dynare_m" ' fname] ;
for i=2:nargin
  command = [command ' ' varargin{i-1}];
end
[status, result] = system(command);
disp(result)
if status
  % Should not use "error(result)" since message will be truncated if too long
  error('Preprocessing failed')
end

if ~ isempty(find(abs(fname) == 46))
	fname = fname(:,1:find(abs(fname) == 46)-1) ;
end
evalin('base',fname) ;