%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initializes Matlab workspace for PROJECT project
%
% Description:
%  This script finds location of project root and calls initialization
%  scripts for lower level libraries and components. This script is meant to
%  be called prior to any simulation run to ensure variables are initialized
%  to the intended values found in lower level initialization scripts.
%
% Modifications:
%  MA-20July18 initial draft
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Create sim_par structure (ini scripts may check for this and a test may not have set it up)
sim_par.dummy = 1;
workspacecleared = 0;
%% Optionally clear all to ensure workspace is clean for development
if (~exist('do_not_clear_flg','var') || do_not_clear_flg == 0)
  bdclose all
  close all
  clear all
  clc
%   restoredefaultpath
  workspacecleared = 1;
  
  %  Set some values for sim_par structure  (if it doesn't already exist) 
  sim_par.t_end          = 10;%[s]
  sim_par.t_step         = 1;
  sim_par.t_sample       = sim_par.t_step;
  sim_par.rel_solver_tol = 1e-6;
  
end

%% Constant strings for displays
starbarstr = '***************************************************************';
dispwidth = length(starbarstr);
disp(starbarstr)
% write workspace cleared if applicable
if (workspacecleared == 1)
  disp(starbarstr)
  dispstr = 'Workspace cleared and paths reset';
  strlen = length(dispstr);
  outstr = sprintf(['* %-',int2str((dispwidth-3)), '.',int2str(strlen), 's*'], dispstr);
  disp(outstr)
end

%% Inform user that initialization has begun
disp(starbarstr)
dispstr = 'Initializing workspace for PROJECT';
strlen = length(dispstr);
outstr = sprintf(['* %-',int2str((dispwidth-3)),'.',int2str(strlen),'s*'],dispstr);
disp(outstr)
disp(starbarstr)

% %% surpress warning about vecnnorm
% if verLessThan('matlab','9.3')
%   % do nothing as matlab hasn't introduced its version of vecnorm before
%   % this version
% else
%   disp ('******* NOTE: disabling warning about vecnorm *****************')
%   warning('off','MATLAB:dispatcher:nameConflict')
%   % this version appears to be compatable but is designed to be more
%   % flexable than our autocodable version, it may be required to rename our
%   % version in the future. 
% end

%% Initialize paths
% determine Root path
rootdir = fileparts( mfilename('fullpath'));

% Add root paths for LVL1s
addpath(fullfile(rootdir,'001-SHELL'))
addpath(fullfile(rootdir,'002-RWSW'))
addpath(fullfile(rootdir,'003-OBSW'))
addpath(fullfile(rootdir,'004-SYSTEM'))
addpath(fullfile(rootdir,'005-LIBRARY'))
addpath(fullfile(rootdir,'006-UTILITIES'))
addpath(fullfile(rootdir,'006-UTILITIES/POSTPROC'))

% Add SHELL/MODELS to the path
addpath(fullfile(rootdir,'001-SHELL/MODELS'))

%% Call LVL initialization scripts
% Initialize tools and libs first and inform user they loaded
addpath(fullfile(rootdir,'005-LIBRARY','SIMULINKLIB'))
run('iniSIMULINKLIB')
dispstr = '-- SIMULINK LIB initialized';
strlen = length(dispstr);
outstr = sprintf(['* %-',int2str((dispwidth-3)), '.',int2str(strlen), 's*'], dispstr);
disp(outstr)

addpath(fullfile(rootdir,'005-LIBRARY','SPICELIB'))
run('iniSPICELIB')
dispstr = '-- SPICE LIB initialized';
strlen = length(dispstr);
outstr = sprintf(['* %-',int2str((dispwidth-3)), '.',int2str(strlen), 's*'], dispstr);
disp(outstr)

addpath(fullfile(rootdir,'005-LIBRARY','MAPLIB'))
run('iniMAPLIB')
dispstr = '-- MAP LIB initialized';
strlen = length(dispstr);
outstr = sprintf(['* %-',int2str((dispwidth-3)), '.',int2str(strlen), 's*'], dispstr);
disp(outstr)


% Initialize RWSW components and inform user they loaded
run('iniRWSW')
dispstr = '-- RWSW initialized';
strlen = length(dispstr);
outstr = sprintf(['* %-',int2str((dispwidth-3)), '.',int2str(strlen), 's*'], dispstr);
disp(outstr)

% Initialize OBSW components and inform user they loaded
run('iniOBSW')
dispstr = '-- OBSW initialized';
strlen = length(dispstr);
outstr = sprintf(['* %-',int2str((dispwidth-3)), '.',int2str(strlen), 's*'], dispstr);
disp(outstr)

% Initialize SYSTEM components and inform user they loaded
dispstr = '-- SYSTEM initialized';
strlen = length(dispstr);
outstr = sprintf(['* %-',int2str((dispwidth-3)), '.',int2str(strlen), 's*'], dispstr);
disp(outstr)



%% Display state of initialization for user
disp(starbarstr)
dispstr = 'Workspace configured for PROJECT';
strlen = length(dispstr);
outstr = sprintf(['* %-',int2str((dispwidth-3)), '.',int2str(strlen), 's*'], dispstr);
disp(outstr)
disp(starbarstr)
%% Set do not clear flg (To ensure variables survive for Monte-Carlo runs)
% do_not_clear_flg = 1

%% clear variables used to set paths
clear rootdir dispstr strlen dispwidth starbarstr outstr