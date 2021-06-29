%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initializes variables for SEN_GYR part of project
%
% Discription:
%  This script sets variables related to SEN_GYR level of the project. where
%  required/desired, a method to overide the default variable value is
%  provided using values fround in sim_par.SEN_GYR_par structure.
%
% Modifications:
%  DB-22Jun21 initial draft
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Parameters to Modify 

if (isfield(sim_par, 'SEN_GYR_par')  && isfieldRecursive(sim_par.SEN_GYR_par,  'noise_power'))
  SEN_GYR_par.noise_power = sim_par.SEN_GYR_par.noise_power;
else
  SEN_GYR_par.noise_power = deg2rad(0.015)^2; % (rad/s)^2/Hz
end

if (isfield(sim_par, 'SEN_GYR_par')  && isfieldRecursive(sim_par.SEN_GYR_par,  'sample_rate'))
  SEN_GYR_par.sample_rate = sim_par.SEN_GYR_par.sample_rate;
else
  SEN_GYR_par.sample_rate = 100; % Hz
end

if (isfield(sim_par, 'SEN_GYR_par')  && isfieldRecursive(sim_par.SEN_GYR_par,  'sensitivity'))
  SEN_GYR_par.sensitivity = sim_par.SEN_GYR_par.sensitivity;
else
  SEN_GYR_par.sensitivity = deg2rad(1/131); % (rad/s)/LSB
end

if (isfield(sim_par, 'SEN_GYR_par')  && isfieldRecursive(sim_par.SEN_GYR_par,  'full_scale_range'))
  SEN_GYR_par.full_scale_range = sim_par.SEN_GYR_par.full_scale_range;
else
  SEN_GYR_par.full_scale_range = 34.907; % rad/s
end