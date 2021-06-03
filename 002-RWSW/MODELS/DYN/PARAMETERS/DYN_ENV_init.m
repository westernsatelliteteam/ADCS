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


%torques
DYN_ENV_par.grvtor_pertenableflg = 1;
DYN_ENV_par.magtor_pertenableflg = 1;
DYN_ENV_par.drgtor_pertenableflg = 1;
DYN_ENV_par.srptor_pertenableflg = 1;

% forces
DYN_ENV_par.drgfor_pertenableflg = 1;
DYN_ENV_par.srpfor_pertenableflg = 1;
% note gravity force perturbations are modled with acceleration directly 
% look in DYN_GRAV_init to play with those values