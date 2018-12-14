% Initialisation file for Runbot-SimScape model
%  28.03.2018 by Daniel
%  includes ground-contact-model by H.Geyer

%% Solver parameters

maxStep=1e-2;
relTol=1e-2;
absTol=1e-3;
MaxOrd=5;

errorswitch = true;    %false - no errors captured, true - errors will terminate simulation
stop5m = true;         %simulation will terminate when 5m are reached if true 

%% load model parameters
simulink_robot_DataFile

%% set environment

g = 9.81;

%% Compliance
% left
spring_ankle_c_l=500;    %[N/m]  ankle spring constant
spring_ankle_rl_l=0.11; %[m]    ankle spring rest length
damper_ankle_l=10;   %[Ns/m] ankle damping coeff.

%right
spring_ankle_c_r=500;     %[N/m]
spring_ankle_rl_r=0.11; %[m]
damper_ankle_r=10;    %[Ns/m]

%initial conditions
IC_phi_hip_r = -29;        %[deg]
IC_phi_hip_l = 10;        %[deg]
IC_phi_knee_r = 0;     %[deg]
IC_phi_knee_l = 0;   %[deg]

IC_y = 0.288; %0.292 [m]
IC_vCOM_x=0.6;
IC_vCOM_y=-.5;

d_joint = 1e-3;   % [Nms/deg]

%% hard stop parameters

c_hs=0.1; %[Nm/deg]
d_hs=0.35; %[Nms/deg]

%ground contact model
M_RB=smiData.Solid(1).mass+2*smiData.Solid(4).mass+2*smiData.Solid(3).mass+2*smiData.Solid(2).mass;
k_gx = 10*M_RB/0.01;
k_gy = 150*M_RB/0.01;
v_gy_max = 0.70; %[m/s]
k_gx = 500/0.1; %[N/m]
k_gx = 10*M_RB/0.01;
% horizontal max relaxation speed
v_gx_max = 0.06; %[m/s]
% sliding friction coefficient
mu_slide = 4.6;
% stiction coefficient
mu_stick = 0.8;
% sliding to stiction limit velocity
vLimit = 0.01; %[m/s]


%% motor parameters
init_motor_parameters;