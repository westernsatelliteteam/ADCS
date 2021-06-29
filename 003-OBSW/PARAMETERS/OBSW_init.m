%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initializes variables for OBSW part of project
%
% Discription:
%  This script sets variables related to OBSW level of the project. were
%  required/desired, a method to overide the default variable value is
%  provided using values fround in sim_par.OBSW_par structure.
%
%
% Modifications:
%  DB-28Jun21 initial draft
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Parameters to Modify
% Date in TAI
if (isfield(sim_par, 'OBSW_par')  && isfieldRecursive(sim_par.OBSW_par,  'detumble_Kw'))
  OBSW_par.detumble_Kw = sim_par.OBSW_par.detumble_Kw;
else
  OBSW_par.detumble_Kw = 17;
end

%% Computed Parameters
