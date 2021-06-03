%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initializes paths for DYN part of project
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
DYNrootdir = fileparts( mfilename('fullpath'));
addpath(fullfile(DYNrootdir,'MODELS'))
addpath(fullfile(DYNrootdir,'PARAMETERS'))

% Intialize parameters at this level  
run(fullfile(DYNrootdir, 'PARAMETERS', 'DYN_init.m'))
run(fullfile(DYNrootdir, 'PARAMETERS', 'DYN_SC_init.m'))
run(fullfile(DYNrootdir, 'PARAMETERS', 'DYN_TRA_init.m'))
run(fullfile(DYNrootdir, 'PARAMETERS', 'DYN_ATT_init.m'))
run(fullfile(DYNrootdir, 'PARAMETERS', 'DYN_MAG_init.m'))
run(fullfile(DYNrootdir, 'PARAMETERS', 'DYN_GRV_init.m'))
run(fullfile(DYNrootdir, 'PARAMETERS', 'DYN_AERO_init.m'))

clear DYNrootdir

