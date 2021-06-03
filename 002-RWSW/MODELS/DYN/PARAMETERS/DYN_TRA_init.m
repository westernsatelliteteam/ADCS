%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initializes variables for DYN_TRA part of project
%
% Discription:
%  This script sets variables related to DYN_TRA level of the project. were
%  required/desired, a method to overide the default variable value is
%  provided using values fround in sim_par.DYN_TRA_par structure.
%
% Modifications:
%  MA-14Jun16 initial draft
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Parameters to Modify
% Default values based on:
%ISS (ZARYA) retrived from http://celestrak.com/NORAD/elements/stations.txt 13Jul16
%1 25544U 98067A   16195.24184387  .00006167  00000-0  97898-4 0  9994
%2 25544  51.6453 288.0416 0001507  55.3972 330.6245 15.54810785  9049


if (isfield(sim_par, 'DYN_TRA_par')  && isfieldRecursive(sim_par.DYN_TRA_par, 'Mdot_revperday'))
  DYN_TRA_par.Mdot_revperday = sim_par.DYN_TRA_par.Mdot_revperday;
else
  DYN_TRA_par.Mdot_revperday = 15.54810785; %[rev/day]
end

if (isfield(sim_par, 'DYN_TRA_par')  && isfieldRecursive(sim_par.DYN_TRA_par, 'ecc'))
  DYN_TRA_par.ecc = sim_par.DYN_TRA_par.ecc;
else
  DYN_TRA_par.ecc = 0.0001507;         % [-]
end

if (isfield(sim_par, 'DYN_TRA_par')  && isfieldRecursive(sim_par.DYN_TRA_par, 'incl'))
  DYN_TRA_par.incl = sim_par.DYN_TRA_par.incl;
else
  DYN_TRA_par.incl =  51.6453 * CONSTANTS_par.deg2rad; % [rad]
end

if (isfield(sim_par, 'DYN_TRA_par')  && isfieldRecursive(sim_par.DYN_TRA_par, 'raan'))
  DYN_TRA_par.raan = sim_par.DYN_TRA_par.raan;
else
  DYN_TRA_par.raan =  288.0416 * CONSTANTS_par.deg2rad; % [rad]
end

if (isfield(sim_par, 'DYN_TRA_par')  && isfieldRecursive(sim_par.DYN_TRA_par, 'argp'))
  DYN_TRA_par.argp = sim_par.DYN_TRA_par.argp;
else
  DYN_TRA_par.argp =  55.3972 * CONSTANTS_par.deg2rad; % [rad]
end

if (isfield(sim_par, 'DYN_TRA_par')  && isfieldRecursive(sim_par.DYN_TRA_par, 'tano'))
  DYN_TRA_par.tano = sim_par.DYN_TRA_par.tano;
else
  DYN_TRA_par.tano =  0* CONSTANTS_par.deg2rad; % [rad]% adjust to vary location in orbit
end




%% Computed Parameters
DYN_TRA_par.Mdot = DYN_TRA_par.Mdot_revperday / CONSTANTS_par.days2sec * CONSTANTS_par.rev2rad ; %[rad/s]
DYN_TRA_par.sma  =( CONSTANTS_par.mu_earth/DYN_TRA_par.Mdot^2)^(1/3);


if ((isfield(sim_par, 'DYN_TRA_par')  && isfieldRecursive(sim_par.DYN_TRA_par,  'pos_ECI_ini'))&& (isfield(sim_par, 'DYN_TRA_par')  && isfieldRecursive(sim_par.DYN_TRA_par,  'vel_ECI_ini')))
  % compute keplarian elements in ECI frame w.r.t ECI frame
  
  DYN_TRA_par.pos_ECI_ini = sim_par.DYN_TRA_par.pos_ECI_ini;
  DYN_TRA_par.vel_ECI_ini = sim_par.DYN_TRA_par.vel_ECI_ini;
  
  
  
  [DYN_TRA_par.sma,   ...
    DYN_TRA_par.ecc,   ...
    DYN_TRA_par.incl,  ...
    DYN_TRA_par.raan,  ...
    DYN_TRA_par.argp,  ...
    DYN_TRA_par.tano,  ...
    DYN_TRA_par.alat ] ...
    = rv2kep(...
    DYN_TRA_par.pos_ECI_ini, DYN_TRA_par.vel_ECI_ini, ...
    CONSTANTS_par.mu_earth, CONSTANTS_par.zero_tol);
else
  % compute pos_ini and vel_ini from keplerain elements
  [DYN_TRA_par.pos_ECI_ini,DYN_TRA_par.vel_ECI_ini]= kep2rv(...
    DYN_TRA_par.sma,        ...
    DYN_TRA_par.ecc,        ...
    DYN_TRA_par.incl,       ...
    DYN_TRA_par.raan,       ...
    DYN_TRA_par.argp,       ...
    DYN_TRA_par.tano,       ...
    CONSTANTS_par.mu_earth, ...
    CONSTANTS_par.zero_tol);
end

DYN_TRA_par.T_orbit_inv = DYN_TRA_par.Mdot/CONSTANTS_par.rev2rad; %[rev/s]