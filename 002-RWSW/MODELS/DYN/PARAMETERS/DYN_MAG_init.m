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

DYN_MAG_par.filename =[fileparts(fileparts(which('readIGRF12coeff.m'))),'/PARAMETERS/igrf12coeffs.txt'];

DYN_MAG_par.max_degree = 13; 

%% Computed Parameters
% Get magnetic coefficents (IGRF12 format)
[DYN_MAG_par.Gnm, ...
 DYN_MAG_par.Hnm, ...
 DYN_MAG_par.GnmDot, ...
 DYN_MAG_par.HnmDot, ...
 DYN_MAG_par.basedate] = readIGRF12coeff(DYN_MAG_par.filename, DYN_par.year_ini);
