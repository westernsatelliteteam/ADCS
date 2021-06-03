%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Generates a mass distribution within the dimensions of the a bounding box
%
% Description:
%   This scrip generates a random mass distribution within the dimensions
%   of the CubeSat and outputs parameters related to Dynamics
%
% Inputs:
% numPoints        Number of Possible Mass Concentrations within Dimensions
% numFill          Number of Mass Concentrations Occupied
%                  Note that as numFill tends to numPoints, mass
%                  distribution will tend to be more uniform
% SCmass           CubeSat Mass in kg
% boundingbox      upper limit on bounding box (as measured from [0, 0, 0])
% DWGorigin        Coordinates of Origin of DWG Frame in MEC Frame
% randomseed       Seed for generating Random Distribution
% plotTrigger      Trigger to hide/show plot
%
% Outputs:
% SCmass           CubeSat Mass in kg
% SCcom_MEC        CubeSat Center of Mass in MEC Frame
% J_DWG            Moment of Inertia in DWG Frame
% J_COM            Moment of Inertia about ORB Frame
% C_DP             Rotational Transform Matrix Principal Axis -> ORB Frame
% J_COMP           Principal Moments of Inertia
%
% References:
% Spacecraft Dynamics and Control Textbook Pg.59
%
% Modifications:
%  08Jun18 Initial Draft
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [SCmass,SCcom_MEC,J_DWG,J_COM,C_DP,J_COMP] = moi_com_randomizer(numPoints,numFill,SCmass,boundingbox,DWGorigin,randomseed,plotTrigger)
  %% Input Validation
  if numPoints<=numFill
  error('Please ensure numPoints > numFill')
  end
  %% Seed for Pseudorandom Parameters
  s = RandStream('mt19937ar','Seed',randomseed); % Seed Value for Repeatability of Results
  RandStream.setGlobalStream(s);
  %% Grid Definition
  x = boundingbox(1);
  y = boundingbox(2);
  z = boundingbox(3);
  shortLength = ceil((numPoints/2)^(1/3));
  longLength = 2*shortLength;
  numPoints = shortLength*shortLength*longLength;
  pointMass = SCmass/numFill;
  for i = numPoints:-1:1
    Cell(i).Index = i;
    Cell(i).Fill = 0;
  end
  for l = -x/2:(x/(longLength-1)):x/2
    for k = -z/2:(z/(shortLength-1)):z/2
      for j = -y/2:(y/(shortLength-1)):y/2
        Cell(i).Pos = [l,j,k] ;
        i = i+1;
      end
    end
  end
  %% Mass Distribution to Particle System
  filled = 0;
  while filled < numFill
    i = floor(1 + (numPoints-1)*rand);
    if Cell(i).Fill == 0
      Cell(i).Fill = 1;
      filled = filled + 1;
    end
  end
  %% COM Calculation
  COMx = 0;
  COMy = 0;
  COMz = 0;
  for i = 1:numPoints
    if Cell(i).Fill == 1
      COMx = COMx + Cell(i).Pos(1);
      COMy = COMy + Cell(i).Pos(2);
      COMz = COMz + Cell(i).Pos(3);
    end
  end
  COMx = COMx/numFill;
  COMy = COMy/numFill;
  COMz = COMz/numFill;
  SCcom_MEC = [COMx;COMy;COMz];
  %% Inertia Calculations
  % About DWGorigin
  IxxDWG = 0;
  IyyDWG = 0;
  IzzDWG = 0;
  IxyDWG = 0;
  IxzDWG = 0;
  IyzDWG = 0;
  for i = 1:numPoints
    if Cell(i).Fill == 1
      IxxDWG = IxxDWG + ((Cell(i).Pos(2)-DWGorigin(2))^2+(Cell(i).Pos(3)-DWGorigin(3))^2)*pointMass;
      IyyDWG = IyyDWG + ((Cell(i).Pos(1)-DWGorigin(1))^2+(Cell(i).Pos(3)-DWGorigin(3))^2)*pointMass;
      IzzDWG = IzzDWG + ((Cell(i).Pos(1)-DWGorigin(1))^2+(Cell(i).Pos(2)-DWGorigin(2))^2)*pointMass;
      IxyDWG = IxyDWG + ((Cell(i).Pos(1)-DWGorigin(1))*(Cell(i).Pos(2)-DWGorigin(2)))*pointMass;
      IxzDWG = IxzDWG + ((Cell(i).Pos(1)-DWGorigin(1))*(Cell(i).Pos(3)-DWGorigin(3)))*pointMass;
      IyzDWG = IyzDWG + ((Cell(i).Pos(2)-DWGorigin(2))*(Cell(i).Pos(3)-DWGorigin(3)))*pointMass;
    end
  end
  J_DWG = [IxxDWG,-IxyDWG,-IxzDWG;-IxyDWG,IyyDWG,-IyzDWG;-IxzDWG,-IyzDWG,IzzDWG];
  % About COM
  IxxCOM = 0;
  IyyCOM = 0;
  IzzCOM = 0;
  IxyCOM = 0;
  IxzCOM = 0;
  IyzCOM = 0;
  for i = 1:numPoints
    if Cell(i).Fill == 1
      IxxCOM = IxxCOM + ((Cell(i).Pos(2)-COMy)^2+(Cell(i).Pos(3)-COMz)^2)*pointMass;
      IyyCOM = IyyCOM + ((Cell(i).Pos(1)-COMx)^2+(Cell(i).Pos(3)-COMz)^2)*pointMass;
      IzzCOM = IzzCOM + ((Cell(i).Pos(1)-COMx)^2+(Cell(i).Pos(2)-COMy)^2)*pointMass;
      IxyCOM = IxyCOM + ((Cell(i).Pos(1)-COMx)*(Cell(i).Pos(2)-COMy))*pointMass;
      IxzCOM = IxzCOM + ((Cell(i).Pos(1)-COMx)*(Cell(i).Pos(3)-COMz))*pointMass;
      IyzCOM = IyzCOM + ((Cell(i).Pos(2)-COMy)*(Cell(i).Pos(3)-COMz))*pointMass;
    end
  end
  J_COM = [IxxCOM,-IxyCOM,-IxzCOM;-IxyCOM,IyyCOM,-IyzCOM;-IxzCOM,-IyzCOM,IzzCOM];
  % Rotation to Principal Axis System
  [C_DP,J_COMP] = eig(J_COM);
  xP = C_DP'*[0.01;0;0];
  yP = C_DP'*[0;0.01;0];
  zP = C_DP'*[0;0;0.01];
  %% Plot Particle System
  if plotTrigger == 1
    figure()
    hold on
    daspect([1,1,1])
    title('Random Mass Distribution')
    scatter3(0,0,0,'*','r')
    scatter3(DWGorigin(1),DWGorigin(2),DWGorigin(3),'o','r')
    scatter3(COMx,COMy,COMz,'o','g')
    quiver3(DWGorigin(1),DWGorigin(2),DWGorigin(3),0.01,0,0,'r')
    quiver3(DWGorigin(1),DWGorigin(2),DWGorigin(3),0,0.01,0,'r')
    quiver3(DWGorigin(1),DWGorigin(2),DWGorigin(3),0,0,0.01,'r')
    quiver3(COMx,COMy,COMz,0.01,0,0,'g')
    quiver3(COMx,COMy,COMz,0,0.01,0,'g')
    quiver3(COMx,COMy,COMz,0,0,0.01,'g')
    quiver3(COMx,COMy,COMz,xP(1),xP(2),xP(3),'k')
    quiver3(COMx,COMy,COMz,yP(1),yP(2),yP(3),'k')
    quiver3(COMx,COMy,COMz,zP(1),zP(2),zP(3),'k')
    for i=1:numPoints
      if Cell(i).Fill == 1
        scatter3(Cell(i).Pos(1),Cell(i).Pos(2),Cell(i).Pos(3),'.','k')
      end
    end
    hold off
    legend('Center of Cubesat - MEC Frame Origin','Center of DWG Frame','Center of Gravity - BOF Frame Origin')
  end
end