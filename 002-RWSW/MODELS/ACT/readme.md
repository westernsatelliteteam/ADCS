LEVEL 1 ACTUATION BLOCK (ACT)

This block is used to compute actuator parameters such as loads from 
Magnetic Torquers or Reaction Wheel Speeds. The actuators can then be 
used to control the attitude of the satellite.

for example this directory could contain: 

PARAMETERS SCRIPTS:
    1) ACT_init.m       Actuation Base Initialization
    2) ACT_MTR_init.m   Magnetic Torquer Parameters
    3) ACT_RW_init.m    Reaction Wheels Parameters

MODELS:
    1) ACT_RWsingle.mdl Unit Reaction Wheel Model
    2) ACT_RWL.mdl      Reaction Wheel Assembly Model
    3) ACT_MTRunit.mdl  Unit MagTorquer Model
    4) ACT_MTR.mdl      MagTorquer Assembly Model
    5) ACT.mdl          Combined Assemble Model