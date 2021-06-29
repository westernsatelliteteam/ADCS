%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initializes variables for SEN_MTM part of project
%
% Discription:
%  This script sets variables related to SEN_MTM level of the project. where
%  required/desired, a method to overide the default variable value is
%  provided using values fround in sim_par.SEN_MTM_par structure.
%
% Modifications:
%  DB-22Jun21 initial draft
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Parameters to Modify 

if (isfield(sim_par, 'SEN_MTM_par')  && isfieldRecursive(sim_par.SEN_MTM_par,  'noise_power'))
  SEN_MTM_par.noise_power = sim_par.SEN_MTM_par.noise_power;
else
  SEN_MTM_par.noise_power = 256e-7; % T^2/Hz
end

if (isfield(sim_par, 'SEN_MTM_par')  && isfieldRecursive(sim_par.SEN_MTM_par,  'sample_rate'))
  SEN_MTM_par.sample_rate = sim_par.SEN_MTM_par.sample_rate;
else
  SEN_MTM_par.sample_rate = 1; % Hz
end

if (isfield(sim_par, 'SEN_MTM_par')  && isfieldRecursive(sim_par.SEN_MTM_par,  'sensitivity'))
  SEN_MTM_par.sensitivity = sim_par.SEN_MTM_par.sensitivity;
else
  SEN_MTM_par.sensitivity = 8e-9; % (rad/s)/LSB
end

if (isfield(sim_par, 'SEN_MTM_par')  && isfieldRecursive(sim_par.SEN_MTM_par,  'full_scale_range'))
  SEN_MTM_par.full_scale_range = sim_par.SEN_MTM_par.full_scale_range;
else
  SEN_MTM_par.full_scale_range = 0.00006; % T
end