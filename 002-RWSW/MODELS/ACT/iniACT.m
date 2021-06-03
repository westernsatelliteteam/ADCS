%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initializes paths for ACT part of project
%
% Discription:
%  This script calls initalization scripts for lower level components. This
%  script is ment to be called as part of the main ini*.m file to ensure
%  variables are intialized to the intended values found in lower level
%  initialization scripts.  
%
% Modifications:
%  MA-14Jun16 initial draft
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Add paths for MODELS and PARAMETERS folders
ACTrootdir = fileparts( mfilename('fullpath'));
addpath(fullfile(ACTrootdir,'MODELS'))
addpath(fullfile(ACTrootdir,'PARAMETERS'))

% Intialize parameters at this level  
% run(fullfile(ACTrootdir, 'PARAMETERS', 'ACT_init.m'))
% run(fullfile(ACTrootdir, 'PARAMETERS', 'ACT_MTR_init.m'))
% run(fullfile(ACTrootdir, 'PARAMETERS', 'ACT_RWL_init.m'))
% run(fullfile(ACTrootdir, 'PARAMETERS', 'ACT_RWLsimple_init.m'))
% run(fullfile(ACTrootdir, 'PARAMETERS', 'ACT_RWLmd_init.m'))

clear ACTrootdir

