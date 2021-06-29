%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initializes variables for ACT_MTR part of project
%
% Discription:
%  This script sets variables related to ACT_MTR level of the project. where
%  required/desired, a method to overide the default variable value is
%  provided using values fround in sim_par.ACT_MTR_par structure.
%
% Modifications:
%  DB-28Jun21 initial draft
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Parameters to Modify 

if (isfield(sim_par, 'ACT_MTR_par')  && isfieldRecursive(sim_par.ACT_MTR_par,  'orientation_array'))
  ACT_MTR_par.orientation_array = sim_par.ACT_MTR_par.orientation_array;
else
  ACT_MTR_par.orientation_array = [[1 0 0];[0 1 0];[0 0 1]]; % XYZ_BOF
end

if (isfield(sim_par, 'ACT_MTR_par')  && isfieldRecursive(sim_par.ACT_MTR_par,  'numLoops_array'))
  ACT_MTR_par.numLoops_array = sim_par.ACT_MTR_par.numLoops_array;
else
  ACT_MTR_par.numLoops_array = [1407;1407;1407]; % #
end

if (isfield(sim_par, 'ACT_MTR_par')  && isfieldRecursive(sim_par.ACT_MTR_par,  'area_array'))
  ACT_MTR_par.area_array = sim_par.ACT_MTR_par.area_array;
else
  ACT_MTR_par.area_array = [0.0019634954;0.0019634954;0.0019634954]; % m^2
end

if (isfield(sim_par, 'ACT_MTR_par')  && isfieldRecursive(sim_par.ACT_MTR_par,  'coreMagFactor_array'))
  ACT_MTR_par.coreMagFactor_array = sim_par.ACT_MTR_par.coreMagFactor_array;
else
  ACT_MTR_par.coreMagFactor_array = [0;0;0]; % A/m
end

if (isfield(sim_par, 'ACT_MTR_par')  && isfieldRecursive(sim_par.ACT_MTR_par,  'length_array'))
  ACT_MTR_par.length_array = sim_par.ACT_MTR_par.length_array;
else
  ACT_MTR_par.length_array = [0.075;0.075;0.075]; % m
end