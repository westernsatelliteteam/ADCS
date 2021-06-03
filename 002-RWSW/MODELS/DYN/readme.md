LEVEL 1 DYNAMICS BLOCK (DYN)

This block is used to compute external loads on the satellite and calculate
parameters regarding the dynamics of the satellite such at attitude, trajectory, 
etc.

PARAMETERS SCRIPTS:
    1) DYN_init.m       Dynamics Base Initialization
    2) DYN_TRA_init.m   Dynamics Trajectory Parameters
    3) DYN_SC_init.m    Dynamics Spacecraft Parameters
    4) DYN_MAG_init.m   International Geomagnetic Reference Field Parameters
    5) DYN_GRV_init.m   Earth Gravitational Model (1996) Parameters
    6) DYN_ENV_init.m   Sum of Forces and Torques Block Parameters
    7) DYN_ATT_init.m   Dyamics Attitude Parameters
    8) DYN_AERO_init.m  Dynamics Aerodynamics Parameters

MODELS:
    1) DYN_TRA.mdl      Dynamics Trajectory Model
    2) DYN_TIME.mdl     Dynamics Time Model
    3) DYN_SRP.mdl      Solar Radiation Pressure Model
    4) DYN_MCI.mdl      SC Mass, COM, and MOI Model
    5) DYN_MAG.mdl      Dynamics Magnetic Loads Model
    6) DYN_GRAV.mdl     Dynamics Gravity Gradient Model
    7) DYN_EPHEM.mdl    Epihermis Model
    8) DYN_ECLIPSE.mdl  Eclipse Model
    9) DYN_ATT.mdl      SC Attitude Control Model
   10) DYN_AERO.mdl     Dynamics Aerodynamic Loads Model
   11) DYN.mdl          Combined Dynamics Model