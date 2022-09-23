%tinashe 
%------------------------------
% Aircraft Parameters
%------------------------------
close all;
clear;
clc;

m=1.56;  %[kg]
g=9.81; %[m/s^2]
altitude=0; %[m] initial altitude 100
Uo=0.01;%inital speed 18.2462
Thrust=10;%kg
%Inertia [Kg-m^2]
Ix=0.1147; 
Iy=0.0576; 
Iz=01712;  
Ixz=0.0015;

% Geomeric Parameters [m];
S=0.2589;
b=1.4224;
c_bar=0.3302;

e=0.85;
AR=b^2/S;
%-----------------------------
%Longitudinal Coefficients
%-----------------------------
CL=0.28;
Cdo=0.03;
Cmo=0;
CLalpha=3.45;
CDalpha=0.30;
Cmalpha=-0.38;
CLq=0;
CDq=0;
Cmq=-3.6;
CLdelta_e=-0.36;
CDdelta_e=0;
Cmdelta_e=-0.5;
Cprop=1.0;

%----------------------------------
%Lateral Coefficients
%----------------------------------
Cyo=0;
Clo=0;
Cno=0;
Cybeta=-0.98;
Clbeta=-0.12;
Cnbeta=0.25;
Cyp=0;
Clp=-0.26;
Cnp=0.022;
Cyr=0;
Clr=0.14;
Cnr=-0.35;
Cydelta_a=0;
Cldelta_a=0.08;
Cndelta_a=0.06;
Cydelta_r=-0.17;
Cldelta_r=0.105;
Cndelta_r=-0.032;







%___________may ignore______
Sprop=0.0314;
rho=1.2682;
Kmotor=20;
%____________________________





%Inertia Matrix

I=[Ix 0 -Ixz;
    0 Iy 0;
    -Ixz 0 Iz];

delta=Iz*Ix-Ixz^2;
I1=Ixz*(Ix-Iy+Iz);
I2=Iy*Iz-Iz^2-Ixz^2;
I3=Ixz^2-Iy*Ix+Ix^2;


%trim ---------------------------

%_____trim inputs________________

%Vector X=[h u v w phi theta psi p q r] the states
%Vector U=[de, dt da dr]

% trim inputs
Va=30;% input air speed in m/s
gamma=0;% input flight path angle in radians
% for level flight set turn radius to infinity else set it to
R=Inf;
rho=1.225;%density at altitude

% the flight condition.
% all states are constant.


CL=2*m*g/(rho*S*Va^2);
alpha=CL/CLalpha;
