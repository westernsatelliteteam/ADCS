%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initializes paths for SEN part of project
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
SENrootdir = fileparts( mfilename('fullpath'));
addpath(fullfile(SENrootdir,'MODELS'))
addpath(fullfile(SENrootdir,'PARAMETERS'))

% Intialize parameters at this level  
% run(fullfile(SENrootdir, 'PARAMETERS', 'SEN_init.m'))
% run(fullfile(SENrootdir, 'PARAMETERS', 'SEN_OBT_init.m'))
% run(fullfile(SENrootdir, 'PARAMETERS', 'SEN_SSS_init.m'))
% run(fullfile(SENrootdir, 'PARAMETERS', 'SEN_TSS_init.m'))
% run(fullfile(SENrootdir, 'PARAMETERS', 'SEN_SOL_init.m'))
% run(fullfile(SENrootdir, 'PARAMETERS', 'SEN_MTM_init.m'))
% run(fullfile(SENrootdir, 'PARAMETERS', 'SEN_GYR_init.m'))
% run(fullfile(SENrootdir, 'PARAMETERS', 'SEN_FOG_init.m'))
% run(fullfile(SENrootdir, 'PARAMETERS', 'SEN_STAR_init.m'))
% run(fullfile(SENrootdir, 'PARAMETERS', 'SEN_GPS_init.m'))
% run(fullfile(SENrootdir, 'PARAMETERS', 'SEN_RWL_init.m'))

clear SENrootdir

