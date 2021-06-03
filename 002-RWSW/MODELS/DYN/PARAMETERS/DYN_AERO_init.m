%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initializes variables for DYN_AERO part of project
%
% Discription:
%  This script sets variables related to DYN_AERO level of the project. were
%  required/desired, a method to overide the default variable value is
%  provided using values fround in sim_par.DYN_AERO_par structure.
%
% Modifications:
%  MA-14Jun16 initial draft
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Parameters to modify 

% else base on initial height
DYN_AERO_par.refheight = (vecnorm3d(DYN_TRA_par.pos_ECI_ini)- CONSTANTS_par.r_earth)/ CONSTANTS_par.km2m;

%% Computed values 
%  Exponential Atmospheric model Table from Vallado
DYN_AERO_par.baseH_array =[...
    0,  25,  30,  40,  50,  60,   70,  ...
   80,  90, 100, 110, 120, 130,  140,  ...
  150, 180, 200, 250, 300, 350,  400,  ...
  450, 500, 600, 700, 800, 900, 1000]; % [km]

DYN_AERO_par.rho_array =[...
  1.225,    3.899e-2,  1.774e-2,  3.972e-3,  1.057e-3,  3.206e-4,  8.770e-5,  ...
  1.905e-5, 3.396e-6,  5.297e-7,  9.661e-8,  2.438e-8,  8.484e-9,  3.845e-9,  ...
  2.070e-9, 5.464e-10, 2.789e-10, 7.248e-11, 2.418e-11, 9.158e-12, 3.725e-12, ...
  1.585e-12,6.967e-13, 1.454e-13, 3.614e-14, 1.170e-14, 5.245e-15, 3.019e-15]; % [kg/m^3]

DYN_AERO_par.scale_array=[...
   7.249,  6.349,  6.682,  7.554,  8.382,  7.714,  6.549, ...
   5.799,  5.382,  5.877,  7.263,  9.473, 12.636, 16.149, ...
  22.523, 29.740, 37.105, 45.546, 53.628, 53.298, 58.515, ...
  60.828, 63.822, 71.835, 88.667, 124.64, 181.05, 268.00]; % [km]
  
% find proper values for base height, reference density and scale height
idx = find (DYN_AERO_par.baseH_array<= DYN_AERO_par.refheight, 1,'last');
DYN_AERO_par.H_REF     =  DYN_AERO_par.baseH_array (idx)* CONSTANTS_par.km2m + CONSTANTS_par.r_earth;% [m]
DYN_AERO_par.rho_REF   =  DYN_AERO_par.rho_array (idx);                        % [kg/m^3]
DYN_AERO_par.scale_REF =  DYN_AERO_par.scale_array (idx) * CONSTANTS_par.km2m; % [m]

clear idx 
