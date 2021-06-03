%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initializes SC related variables for DYN part of project
%
% Discription:
%  This script sets variables related to the Spacecraft itself. if it were
%  required/desired, a method to overide the default variable value is
%  provided using values fround in sim_par.DYN_par structure.
%
% Modifications:
%  MA-06Oct16 initial draft
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

x       = 0.3;    % [m]
y       = 0.11;    % [m]
z       = 0.1;    % [m]
SCmass  = 4;

% Ideal MOI
Ixx = 1/12 * SCmass * (y^2 + z^2); % [kg m^2]
Iyy = 1/12 * SCmass * (x^2 + z^2); % [kg m^2]
Izz = 1/12 * SCmass * (y^2 + x^2); % [kg m^2]


if (isfield(sim_par, 'DYN_SC_par') && isfieldRecursive(sim_par.DYN_SC_par, 'SCmass'))
  DYN_SC_par.SCmass = sim_par.DYN_SC_par.SCmass ;
else
  DYN_SC_par.SCmass = SCmass;% [kg m^2]
end

if (isfield(sim_par, 'DYN_SC_par') && isfieldRecursive(sim_par.DYN_SC_par, 'SCinertia_BOF'))
  DYN_SC_par.SCinertia_BOF = sim_par.DYN_SC_par.SCinertia_BOF ;
else
  DYN_SC_par.SCinertia_BOF = [Ixx, 0, 0; 0, Iyy, 0; 0, 0, Izz];% [kg m^2]
end


clear Ixx Iyy Izz SCmass

%% Space craft Geometry in MEC frame
if (isfield(sim_par, 'DYN_SC_par') && isfieldRecursive(sim_par.DYN_SC_par, 'SCcom_MEC'))
  DYN_SC_par.SCcom_MEC = sim_par.DYN_SC_par.SCcom_MEC ;
else
  DYN_SC_par.SCcom_MEC = [0; 0 ; 0];
end

% assume BOF and MEC are cooincident to make this test simpler to
% interpret
DYN_SC_par.PNLcop_MEC_array = [ ...
  +x/2, +0.0,  +0.0;     ... +X face
  -x/2, +0.0,  +0.0;     ... -X face
  +0.0,  +y/2, +0.0;     ... +Y face
  +0.0,  -y/2, +0.0;     ... -Y face
  +0.0,  +0.0,  +z/2;    ... +Z face
  +0.0,  +0.0,  -z/2]';  ... -Z face
  
DYN_SC_par.PNLuvec_MEC_array = [...
  +1,  +0,  +0;   ... +X face
  -1,  +0,  +0;   ... -X face
  +0,  +1,  +0;   ... +Y face
  +0,  -1,  +0;   ... -Y face
  +0,  +0,  +1;   ... +Z face
  +0,  +0,  -1]'; ... -Z face
  
DYN_SC_par.PNLarea_array = [...
  y * z; ... +X face
  y * z; ... -X face
  x * z; ... +Y face
  x * z; ... -Y face
  x * y; ... +Z face
  x * y];%   -Z face

DYN_SC_par.num_panels= numel(DYN_SC_par.PNLarea_array);
%% Spacecraft drag parameters
% cd of 2.0 is a typical value for cd for spacecraft 1.28 for a flat plate ~2 for a rectanglular box
% its all a blind guess without actual testing
DYN_SC_par.PNLcd_array = ones(DYN_SC_par.num_panels,1)*2.0;
if (isfield(sim_par, 'DYN_SC_par') && isfieldRecursive(sim_par.DYN_SC_par, 'PNLcd_array'))
  DYN_SC_par.PNLcd_array = sim_par.DYN_SC_par.PNLcd_array ;
else
  DYN_SC_par.PNLcd_array = ones(DYN_SC_par.num_panels,1)*2.0;
end

% DYN_SC_par.PNLcd_array = ones(DYN_SC_par.num_panels,1)*0

%% Spacecraft Albedo Parameters
%(assuming a mostly shiny spacecraft)
DYN_SC_par.PNLcrdiffuse_array  = ones(DYN_SC_par.num_panels,1)*0.15;
DYN_SC_par.PNLcrspecular_array = ones(DYN_SC_par.num_panels,1)*0.75;

%% Residual magnetic moment
% guess at rmm based on small current
maxcurrentlooparea            = [y*z; x*z; x*y] *0.8; % %say 80% of maximum areas [m^2]
current                       = 0.001;% guess at worst case current loop power [A]mps
direction                     = [-1; 1; -1]; %[-] modifies direction of magnetic moment
DYN_SC_par.residualmagmom_BOF = current*maxcurrentlooparea.*direction;% [Am^2];
% DYN_SC_par.residualmagmom_BOF =[0;0;0]
clear maxcurrentlooparea current direction

clear x y z SCmass