%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initializes variables for DYN_MAG part of project
%
% Discription:
%  This script sets variables related to DYN_MAG level of the project. were
%  required/desired, a method to overide the default variable value is
%  provided using values fround in sim_par.DYN_par structure.
%
% Modifications:
%  MA-14Jun16 initial draft
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Parameters to Modify 

DYN_GRV_par.filename =[fileparts(fileparts(which('readgrvcoeff_EGM96.m'))),'/PARAMETERS/egm96_to360.ascii'];

DYN_GRV_par.max_degree = 15;
DYN_GRV_par.max_order = 15;

%% Computed Parameters
[DYN_GRV_par.Cnm, ...
 DYN_GRV_par.Snm] = readgrvcoeff_EGM96(DYN_GRV_par.filename);
