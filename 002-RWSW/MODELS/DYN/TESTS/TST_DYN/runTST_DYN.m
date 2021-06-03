%% intialize workspace if DYN_SC_par doesn't exist
if(~exist('DYN_SC_par','var'))
  close all
  disp ('intializing workspace for the first time')
  run ('../../../../../iniPROJECT.m')
end
do_not_clear_flg = 1;  % set do not clear flag so sim_par survives reintialization

%% Ensure test runs in test folder (fewer slprj dirs spread about)
testdir = fileparts( mfilename('fullpath'));
cd (testdir)
%% Constants
sim_par.t_end          = 90*60 * 5;%[s] % ~5 orbits
sim_par.t_step         = 1;
sim_par.rel_solver_tol = 1e-6;
%% parameters to vary from defaults
% sim_par.DYN_SC_par.SCcom_MEC =[0.005;0.005;0.005];
% sim_par.DYN_SC_par.SCcom_MEC =[0.0025;0.0025;0.0025];
sim_par.DYN_SC_par.SCcom_MEC =[0.001;0.001;0.001];
% sim_par.DYN_SC_par.SCcom_MEC =[0.0025;0.0025;0.0025];

%% intialize for sim_par changes
disp('intializing workspace for the simulation')
run ('../../../../../iniPROJECT.m')

%% Run the Simulink model
resultsdir= [testdir,'/',formatdate(now)];
mkdir(resultsdir)

tic
% open('TST_DYN')
simOut=sim('TST_DYN','SimulationMode','rapid');
time2execute= toc

%% Plot Results
plot_DYN(simOut, DYN_TRA_par.T_orbit_inv, CONSTANTS_par, resultsdir, [1:1:9]);
% run plotTST_DYN.m
