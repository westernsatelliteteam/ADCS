%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initialize values for constants used in RWSW part of project
%
% Discription:
%  This script sets variables related to RWSW level of the project. were
%  required/desired, a method to overide the default variable value is
%  provided using values fround in sim_par.RWSW_par structure.
%
%
% Modifications:
%  MA-14Jun16 initial draft
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

CONSTANTS_par.deg2rad  = pi/180;                   % [rad/deg]
CONSTANTS_par.rad2deg  = 1/CONSTANTS_par.deg2rad;  % [deg/rad]
CONSTANTS_par.deg2as   = 3600;                     % [as/deg]
CONSTANTS_par.as2deg   = 1/CONSTANTS_par.deg2as ;  % [deg/as]
CONSTANTS_par.km2m     = 1000;                     % [m/km]
CONSTANTS_par.AU2m     = 149597870700.0;           % [m/AU] % SMAD
CONSTANTS_par.days2sec = (60 * 60 * 24);           % [s/day]
CONSTANTS_par.rev2rad  = 2 * pi;                   % [rads/rev]

CONSTANTS_par.G                = 6.67259e-11;    % [m^3/(kg*s^2)]% vallado pg.130
CONSTANTS_par.r_earth          = 6378137;        % [m]        % vallado cover
CONSTANTS_par.mu_earth         = 3.986004415e14; % [m^3/s^2]  % vallado cover
CONSTANTS_par.flattening_earth = 1.0/298.25642;  % [-]        % vallado cover
CONSTANTS_par.mass_earth       = 5.9733328e24;   % [kg]       % vallado cover
CONSTANTS_par.r_sun            = 695700000;      % [m]

% Solar Flux related constants
CONSTANTS_par.C            = 299792458;      % [m/s]   The speed of light (SMAD front cover)
CONSTANTS_par.avgSolarFlux = 1367;           % [w/m^2] @ 1AU average solar flux (SMAD front cover) 

% zero constants 
CONSTANTS_par.zero_tol = 1e-9; % general purpose zero_tol

% magnetic unit conversions because gauss unit confuses metric prefixes for MA
CONSTANTS_par.T2gauss   = 10000;
CONSTANTS_par.gauss2T   = 1 / CONSTANTS_par.T2gauss;
CONSTANTS_par.T2uT      = 1000000;
CONSTANTS_par.uT2T      = 1 / CONSTANTS_par.T2uT;
CONSTANTS_par.T2nT      = 1000000000;
CONSTANTS_par.nT2T      = 1/CONSTANTS_par.T2nT;
CONSTANTS_par.gauss2uT  = CONSTANTS_par.gauss2T*CONSTANTS_par.T2uT;
CONSTANTS_par.uT2gauss  = 1/CONSTANTS_par.gauss2uT;

