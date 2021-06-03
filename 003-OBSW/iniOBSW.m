%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initializes paths for OBSW part of project
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
OBSWrootdir = fileparts( mfilename('fullpath'));
addpath(fullfile(OBSWrootdir,'MODELS'))
addpath(fullfile(OBSWrootdir,'PARAMETERS'))

% Intialize parameters at this level  
% run(fullfile(OBSWrootdir,'PARAMETERS','OBSW_init.m'))
% run(fullfile(OBSWrootdir,'PARAMETERS','OBSW_CONSTANTS_init.m'))
% run(fullfile(OBSWrootdir,'PARAMETERS','OBSW_SC_init.m'))
% 
% % Add root paths of sub modules 
% addpath(fullfile(OBSWrootdir,'MODELS', 'NAV'))
% addpath(fullfile(OBSWrootdir,'MODELS', 'GDC'))
% addpath(fullfile(OBSWrootdir,'MODELS', 'CTL'))
% 
% % Call submodule level ini files
% run(fullfile(OBSWrootdir, 'MODELS', 'NAV', 'iniNAV.m'))
% run(fullfile(OBSWrootdir, 'MODELS', 'GDC', 'iniGDC.m'))
% run(fullfile(OBSWrootdir, 'MODELS', 'CTL', 'iniCTL.m'))

clear OBSWrootdir
