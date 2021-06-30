%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initializes variables for SEN_SPC part of project
%
% Discription:
%  This script sets variables related to SEN_SPC level of the project. where
%  required/desired, a method to overide the default variable value is
%  provided using values fround in sim_par.SEN_SPC_par structure.
%
% Modifications:
%  DB-22Jun21 initial draft
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Parameters to Modify 

if (isfield(sim_par, 'SEN_SPC_par')  && isfieldRecursive(sim_par.SEN_SPC_par,  'noise_power'))
  SEN_SPC_par.noise_power = sim_par.SEN_SPC_par.noise_power;
else
  SEN_SPC_par.noise_power = 0.0001; % (A)^2/Hz
end

if (isfield(sim_par, 'SEN_SPC_par')  && isfieldRecursive(sim_par.SEN_SPC_par,  'sample_rate'))
  SEN_SPC_par.sample_rate = sim_par.SEN_SPC_par.sample_rate;
else
  SEN_SPC_par.sample_rate = 1; % Hz
end

if (isfield(sim_par, 'SEN_SPC_par')  && isfieldRecursive(sim_par.SEN_SPC_par,  'sensitivity'))
  SEN_SPC_par.sensitivity = sim_par.SEN_SPC_par.sensitivity;
else
  SEN_SPC_par.sensitivity = 0.0001; % (A)/LSB
end

if (isfield(sim_par, 'SEN_SPC_par')  && isfieldRecursive(sim_par.SEN_SPC_par,  'full_scale_range'))
  SEN_SPC_par.full_scale_range = sim_par.SEN_SPC_par.full_scale_range;
else
  SEN_SPC_par.full_scale_range = 2; % A
end