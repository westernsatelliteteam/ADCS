%% Deinitialize paths
% determine Root path
rootdir = fileparts( mfilename('fullpath'));

% Rm root paths for LVL1s
rmpath(fullfile(rootdir,'001-SHELL'))
rmpath(fullfile(rootdir,'002-RWSW'))
rmpath(fullfile(rootdir,'003-OBSW'))
rmpath(fullfile(rootdir,'004-SYSTEM'))
rmpath(fullfile(rootdir,'005-LIBRARY'))
rmpath(fullfile(rootdir,'006-UTILITIES'))
rmpath(fullfile(rootdir,'006-UTILITIES/POSTPROC'))

% Rm SHELL/MODELS to the path
rmpath(fullfile(rootdir,'001-SHELL/MODELS'))

rmpath(fullfile(rootdir,'005-LIBRARY','SIMULINKLIB'))
rmpath(fullfile(rootdir,'005-LIBRARY','SPICELIB'))
rmpath(fullfile(rootdir,'005-LIBRARY','MAPLIB'))

% Rm RWSW
RWSWrootdir = fullfile(rootdir,'002-RWSW');

rmpath(fullfile(RWSWrootdir,'MODELS'))
rmpath(fullfile(RWSWrootdir,'PARAMETERS'))
rmpath(fullfile(RWSWrootdir,'MODELS', 'ACT'))
rmpath(fullfile(RWSWrootdir,'MODELS', 'DYN'))
rmpath(fullfile(RWSWrootdir,'MODELS', 'SEN'))

DYNrootdir = fullfile(RWSWrootdir,'MODELS','DYN');
rmpath(fullfile(DYNrootdir,'MODELS'))
rmpath(fullfile(DYNrootdir,'PARAMETERS'))

ACTrootdir = fullfile(RWSWrootdir,'MODELS','ACT');
rmpath(fullfile(ACTrootdir,'MODELS'))
rmpath(fullfile(ACTrootdir,'PARAMETERS'))

SENrootdir = fullfile(RWSWrootdir,'MODELS','SEN');
rmpath(fullfile(SENrootdir,'MODELS'))
rmpath(fullfile(SENrootdir,'PARAMETERS'))

% Rm OBSW

OBSWrootdir = fullfile(rootdir,'003-OBSW');
rmpath(fullfile(OBSWrootdir,'MODELS'))
rmpath(fullfile(OBSWrootdir,'PARAMETERS'))

%% Rm maplib
MAPLIBrootdir = fullfile(rootdir,'005-LIBRARY','MAPLIB');

rmpath(fullfile(MAPLIBrootdir, 'm_map'))

%% Rm simulinklib

SIMULINKrootdir = fullfile(rootdir,'005-LIBRARY','SIMULINKLIB');

rmpath(fullfile(SIMULINKrootdir, '002-LIBRARY', 'MODELS'));
rmpath(fullfile(SIMULINKrootdir, '002-LIBRARY', 'MODELS', 'LIB_ACT',  'MODELS'))
rmpath(fullfile(SIMULINKrootdir, '002-LIBRARY', 'MODELS', 'LIB_DYN',  'MODELS'))
rmpath(fullfile(SIMULINKrootdir, '002-LIBRARY', 'MODELS', 'LIB_ENV',  'MODELS'))
rmpath(fullfile(SIMULINKrootdir, '002-LIBRARY', 'MODELS', 'LIB_FDI',  'MODELS'))
rmpath(fullfile(SIMULINKrootdir, '002-LIBRARY', 'MODELS', 'LIB_ORB',  'MODELS'))
rmpath(fullfile(SIMULINKrootdir, '002-LIBRARY', 'MODELS', 'LIB_ROT',  'MODELS'))
rmpath(fullfile(SIMULINKrootdir, '002-LIBRARY', 'MODELS', 'LIB_SEN',  'MODELS'))
rmpath(fullfile(SIMULINKrootdir, '002-LIBRARY', 'MODELS', 'LIB_TIME', 'MODELS'))

%% Rm spicelib

archstr= computer('arch');
if strcmp(archstr,'win64')
  MICEPATH = '002-MICE_win64';
elseif strcmp(archstr,'glnxa64')
  MICEPATH = '003-MICE_linux64';
elseif strcmp(archstr,'maci64')
  MICEPATH = '004-MICE_mac64';
end

SPICELIBrootdir = fullfile(rootdir,'005-LIBRARY','SPICELIB');

rmpath(fullfile(SPICELIBrootdir,'001-MinimumKernels'))
rmpath(fullfile(SPICELIBrootdir, MICEPATH, 'src/mice'))
rmpath(fullfile(SPICELIBrootdir, MICEPATH, 'lib'))

%%
clear;
clc;