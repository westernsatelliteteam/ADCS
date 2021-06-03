%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initializes paths for RWSW part of project
%
% Discription:
%  This script calls initalization scripts for lower level components. This
%  script is ment to be called as part of the main ini*.m file to ensure
%  variables are intialized to the intended values found in lower level
%  initialization scripts.  
%
% Modifications:
%  MA-14Jun16 initial draft
%  AJ-24Jul18 added PWR sub module
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Add paths for MODELS and PARAMETERS folders
RWSWrootdir = fileparts( mfilename('fullpath'));
addpath(fullfile(RWSWrootdir,'MODELS'))
addpath(fullfile(RWSWrootdir,'PARAMETERS'))

% Intialize parameters at this level  
run(fullfile(RWSWrootdir,'PARAMETERS','RWSW_init.m'))
run(fullfile(RWSWrootdir,'PARAMETERS','CONSTANTS_init.m'))

% Add root paths of sub modules 
addpath(fullfile(RWSWrootdir,'MODELS', 'ACT'))
addpath(fullfile(RWSWrootdir,'MODELS', 'DYN'))
addpath(fullfile(RWSWrootdir,'MODELS', 'SEN'))
% addpath(fullfile(RWSWrootdir,'MODELS', 'PWR'))

% Call submodule level ini files
run(fullfile(RWSWrootdir, 'MODELS', 'ACT', 'iniACT.m'))
run(fullfile(RWSWrootdir, 'MODELS', 'DYN', 'iniDYN.m'))
run(fullfile(RWSWrootdir, 'MODELS', 'SEN', 'iniSEN.m'))
% run(fullfile(RWSWrootdir, 'MODELS', 'PWR', 'iniPWR.m'))
clear RWSWrootdir
