%% intialize workspace if DYN_SC_par doesn't exist
if(~exist('DYN_SC_par','var'))
  close all
  disp ('intializing workspace for the first time')
  run ('../../../iniESSENCE.m')
end

%% Set random seed and clear data
randomseed = 2017; % seed value picked randomly :P
s = RandStream('mt19937ar','Seed',randomseed);
RandStream.setGlobalStream(s);
do_not_clear_flg = 1;  % set do not clear flag so sim_par survives reintialization

%% Ensure test runs in test folder (fewer slprj dirs spread about)
sim_par.testdir = fileparts( mfilename('fullpath'));
cd (sim_par.testdir)

%% Set constants for simulation
sim_par.t_end           = 1/DYN_TRA_par.T_orbit_inv * 7;%[s] % ~7 orbits
% sim_par.t_end             = 1/DYN_TRA_par.T_orbit_inv * 15;%[s] % ~15 orbits
% sim_par.t_end           = 1/DYN_TRA_par.T_orbit_inv * 25;%[s] % ~25 orbits
% sim_par.t_step          = .2;
sim_par.t_step            = .5;
sim_par.t_sample          = sim_par.t_step;
sim_par.numruns           = 1;


sim_par.rel_solver_tol    = 1e-6;
sim_par.filterstep        = 1;
sim_par.useperfecttorque  = 0;
sim_par.enableController  = 1;
sim_par.useestimate       = 1;

sim_par.NAV_MAGoutflg       = 1;
sim_par.NAV_ORBoutflg       = 1;
sim_par.NAV_SUNoutflg       = 1;
sim_par.NAV_ECLIPSEoutflg   = 1;
sim_par.NAV_PPCSSSoutflg    = 1;
sim_par.NAV_PPCMTMoutflg    = 1;
sim_par.NAV_PPCGYRoutflg    = 1;
sim_par.NAV_PPCSOLoutflg    = 1;

sim_par.residualmagmom_BOF_sys =[0;0;0];

sim_par.DYN_SC_par.SCcom_MEC =[0.0025;-0.0025;0.005];
% sim_par.DYN_SC_par.SCcom_MEC =[0.0;0.0;0.0];


%% Control disturbances used in simulation
disable_eclipseflg  = 0;
disable_rmmanddrag  = 0;
disable_rmm         = 0;
disable_drag        = 0;
disable_srp         = 0;

% control additional filter elements
disable_gg_filtertorques  = 0;
disable_mag_filtertorques = 0;

% control parameters based on flags
if disable_rmmanddrag == 1
  disable_rmm  = 1;
  disable_drag = 1;
end

if disable_drag == 1
  DYN_SC_par.PNLcd_array = ones(size(DYN_SC_par.PNLcd_array))*0;
  
else
  DYN_SC_par.PNLcd_array = ones(size(DYN_SC_par.PNLcd_array))*2.20;%flatplate
end

if disable_srp == 1
  DYN_SC_par.PNLcrdiffuse_array  = ones(size(DYN_SC_par.PNLcd_array))*0;
  DYN_SC_par.PNLcrspecular_array = ones(size(DYN_SC_par.PNLcd_array))*0;
  
else
  %   DYN_SC_par.PNLcrdiffuse_array  = ones(size(DYN_SC_par.PNLcd_array))*0;
  %   DYN_SC_par.PNLcrspecular_array = ones(size(DYN_SC_par.PNLcd_array))*0;
end

if disable_rmm == 1
  DYN_SC_par.residualmagmom_BOF = [0.000;0.000;0.000];
else
  %   DYN_SC_par.residualmagmom_BOF=DYN_SC_par.residualmagmom_BOF*10
  %   DYN_SC_par.residualmagmom_BOF = 1.0e-03*[ -0.1600;   0.1600;   -0.0800]%larger dipole
  %   DYN_SC_par.residualmagmom_BOF = [ 0.030;   0.030;   0.030]%larger dipole
end

%% reduce gravity perturbations to zonal model to speed up execution
DYN_GRV_par.max_degree = 6;
DYN_GRV_par.max_order  = 0;

%% itterate over a number of test runs
for i=1:1:sim_par.numruns
  %% clear previous run's graphs and data
  clear OUT_*           % ditch previous results if they are in the workspace
  close all
  
  %% Initialize DYN_ATT Parameters
  % Randomize Intial Location
  offsets_deg = ((rand(3,1)-0.5) * 2) * 30;
  rotx = (180 + offsets_deg(1)) * CONSTANTS_par.deg2rad;
  roty = (  0 + offsets_deg(2)) * CONSTANTS_par.deg2rad;
  rotz = (  0 + offsets_deg(3)) * CONSTANTS_par.deg2rad;
  
  % Randomize Intial Rates
  BOFw_relORB_BOF_degpersec_ini = ((rand(3,1)-0.5) * 1/2) * DYN_TRA_par.Mdot*CONSTANTS_par.rad2deg;
  
  sim_par.DYN_ATT_par.BOF_ORB_ini = dcm_rot1(rotx)*dcm_rot2(roty)*dcm_rot3(rotz);
  sim_par.DYN_ATT_par.BOFw_relORB_BOF_ini= BOFw_relORB_BOF_degpersec_ini * CONSTANTS_par.deg2rad;
  
  %% Intialize workspace for this specfic run
  disp('intializing workspace for the simulation')
  run ('../../../iniESSENCE.m')
  cd (sim_par.testdir)
  
  %% make results directory
  resultsdir= [sim_par.testdir,'/',formatdate(now)];
  mkdir(resultsdir)
  
  % save intial conditions to help debug cases that don't run
  save([resultsdir,'/preRun.mat'])
  
  %% Run the Simulink model
  disp ('starting Simulation')
  tic
  simOut = sim('SIT_RWSW','SimulationMode','rapid');
  time2execute= toc %#ok<NOPTS> i want to show the run time on the window
  save([resultsdir,'/postRun.mat'])
  
  %% plot results(graphs will be saved in results folder)
  tic
  cd (sim_par.testdir)
  plot_ACT(simOut, DYN_TRA_par.T_orbit_inv, CONSTANTS_par, DYN_SC_par, ACT_MTR_par, resultsdir, [1:1:2]);
  plot_DYN(simOut, DYN_TRA_par.T_orbit_inv, CONSTANTS_par, resultsdir, [1:1:9]);
  plot_SEN(simOut, DYN_TRA_par.T_orbit_inv, CONSTANTS_par, DYN_SC_par, resultsdir, [1:1:8])
  
  
  plottime = toc %#ok<NOPTS> i want to show the run time on the window
end