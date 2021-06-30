%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initializes variables for SEN_SUN part of project
%
% Discription:
%  This script sets variables related to SEN_SUN level of the project. where
%  required/desired, a method to overide the default variable value is
%  provided using values fround in sim_par.SEN_SUN_par structure.
%
% Modifications:
%  DB-22Jun21 initial draft
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Parameters to Modify 

if (isfield(sim_par, 'SEN_SUN_par')  && isfieldRecursive(sim_par.SEN_SUN_par,  'noise_power'))
  SEN_SUN_par.noise_power = sim_par.SEN_SUN_par.noise_power;
else
  SEN_SUN_par.noise_power = 0.0001; % (rad)^2/Hz
end

if (isfield(sim_par, 'SEN_SUN_par')  && isfieldRecursive(sim_par.SEN_SUN_par,  'sample_rate'))
  SEN_SUN_par.sample_rate = sim_par.SEN_SUN_par.sample_rate;
else
  SEN_SUN_par.sample_rate = 5; % Hz
end

if (isfield(sim_par, 'SEN_SUN_par')  && isfieldRecursive(sim_par.SEN_SUN_par,  'sensitivity'))
  SEN_SUN_par.sensitivity = sim_par.SEN_SUN_par.sensitivity;
else
  SEN_SUN_par.sensitivity = deg2rad(0.2); % (rad)/LSB
end

if (isfield(sim_par, 'SEN_SUN_par')  && isfieldRecursive(sim_par.SEN_SUN_par,  'FOV'))
  SEN_SUN_par.FOV = sim_par.SEN_SUN_par.FOV;
else
  SEN_SUN_par.FOV = deg2rad(120); % rad
end