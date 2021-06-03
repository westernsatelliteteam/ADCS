%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initializes variables for DYN part of project
%
% Discription:
%  This script sets variables related to DYN level of the project. were
%  required/desired, a method to overide the default variable value is
%  provided using values fround in sim_par.DYN_par structure.
%
%
% Modifications:
%  MA-14Jun16 initial draft
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Parameters to Modify
% Date in TAI
if (isfield(sim_par, 'DYN_par')  && isfieldRecursive(sim_par.DYN_par,  'year_ini'))
  DYN_par.year_ini = sim_par.DYN_par.year_ini;
else
  DYN_par.year_ini = 2018;
end

if (isfield(sim_par, 'DYN_par')  && isfieldRecursive(sim_par.DYN_par,  'month_ini'))
  DYN_par.month_ini = sim_par.DYN_par.month_ini;
else
  DYN_par.month_ini = 01;
end

if (isfield(sim_par, 'DYN_par')  && isfieldRecursive(sim_par.DYN_par,  'day_ini'))
  DYN_par.day_ini = sim_par.DYN_par.day_ini;
else
  DYN_par.day_ini = 1;
end

if (isfield(sim_par, 'DYN_par')  && isfieldRecursive(sim_par.DYN_par,  'hour_ini'))
  DYN_par.hour_ini = sim_par.DYN_par.hour_ini;
else
  DYN_par.hour_ini = 0;
end

if (isfield(sim_par, 'DYN_par')  && isfieldRecursive(sim_par.DYN_par,  'min_ini'))
  DYN_par.min_ini = sim_par.DYN_par.min_ini;
else
  DYN_par.min_ini = 0;
end

if (isfield(sim_par, 'DYN_par')  && isfieldRecursive(sim_par.DYN_par,  'sec_ini'))
  DYN_par.sec_ini = sim_par.DYN_par.sec_ini;
else
  DYN_par.sec_ini = 0;
end

%% Computed Parameters
% compute initial JD (TAI)
DYN_par.time_relJDepoch_TAI_days_ini = ymdhms2jd( DYN_par.year_ini,  ...
                                                  DYN_par.month_ini, ...
                                                  DYN_par.day_ini,  ...
                                                  DYN_par.hour_ini, ...
                                                  DYN_par.min_ini,   ...
                                                  DYN_par.sec_ini);

% Set ranges for times to compute ephemris for
DYN_par.time_relJDepoch_TAI_days_start = DYN_par.time_relJDepoch_TAI_days_ini - 1;
DYN_par.time_relJDepoch_TAI_days_end   = DYN_par.time_relJDepoch_TAI_days_ini + 1.5*365;
DYN_par.timestep_TAI_days =1/48;

% Compute Ephemeris based on this frame and origin
DYN_par.origin_frame_str ='J2000';
DYN_par.origin_str = 'EARTH';

% check if we need to clear spice variables (previous failed start?)
if(cspice_ktotal('all') > 0)
  cspice_kclear;
end

% find path to kernels (part of lib or somewhere local to project)
DYN_par.datafilepath = fileparts(which('naif0011.tls'));

% load spice kernels
cspice_furnsh([DYN_par.datafilepath filesep 'naif0012.tls']);
cspice_furnsh([DYN_par.datafilepath filesep 'pck00010.tpc']);

cspice_furnsh([DYN_par.datafilepath filesep 'earth_assoc_itrf93.tf']);
cspice_furnsh([DYN_par.datafilepath filesep 'earth_latest_high_prec.bpc']);
cspice_furnsh([DYN_par.datafilepath filesep 'earth_720101_070426.bpc']);
cspice_furnsh([DYN_par.datafilepath filesep 'earth_070425_370426_predict.bpc']);
cspice_furnsh([DYN_par.datafilepath filesep 'de430.bsp'   ]);

EARTHstates = getspiceephem(DYN_par.time_relJDepoch_TAI_days_start, ...
                            DYN_par.time_relJDepoch_TAI_days_end,   ...
                            DYN_par.timestep_TAI_days,              ...
                            'EARTH',                                ...
                            'ITRF93',                               ...
                            DYN_par.origin_str,                     ...
                            DYN_par.origin_frame_str );

SUNstates = getspiceephem(  DYN_par.time_relJDepoch_TAI_days_start, ...
                            DYN_par.time_relJDepoch_TAI_days_end,   ...
                            DYN_par.timestep_TAI_days,              ...
                            'SUN',                                  ...
                            'IAU_SUN',                              ...
                            DYN_par.origin_str,                     ...
                            DYN_par.origin_frame_str );

MOONstates = getspiceephem( DYN_par.time_relJDepoch_TAI_days_start, ...
                            DYN_par.time_relJDepoch_TAI_days_end,   ...
                            DYN_par.timestep_TAI_days,              ...
                            'MOON',                                 ...
                            'IAU_MOON',                             ...
                            DYN_par.origin_str,                     ...
                            DYN_par.origin_frame_str );
