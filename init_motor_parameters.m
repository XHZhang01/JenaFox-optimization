
Ue = 4.8;
Ue_hip_for = 3;%1.6;                       %[V] Eingangsspannung
Ue_hip_back = 1.7;
Ue_knee_for = 2;
Ue_knee_back = 1;%2.4;
Ue_knee_hold = 0.6;

amplifier = 2.28;                       % Verstärkungsfaktor des Motorenverstärkers

g = 9.81;                               %[m/s^2]

%t_sample = 0.01;                        %Sampletime for lookup table
GC_level = 0.2;
GC_gain = 20;

%*************************************************************
%HiTec HS-82MG - 12133
%*************************************************************

knee_amp = 0.15;                         % Verdstärkungsfaktor Anschlag

knee_Um = 1.5;                          %[V] Nominalspannung
knee_Us = 0.9;                           %[V] Anhaltespannung
knee_n0 = 22600;                        %[1/min] -> Leerlaufdrehzahl
knee_I0 = 0.08;                         %[A] -> Leerlaufstrom nur Motor
knee_I0g = 0.11;                        %[A] -> Leerlaufstrom mit Getriebe
knee_Ia = 0.142;                        %[A] -> Anlaufstrom nur Motor
knee_Iag = 0.161;                       %[A] -> Anlaufstrom mit Getriebe
knee_Is = 1.35;                         %[A] -> Stillstandstrom
knee_nm = 20600;                        %[1/min] -> Drehzahl bei Mm
knee_Im = 0.29;                         %[A] -> Strom bei nm

knee_r = 0.004;                         %[m] Radius Anker
knee_m = 0.004;                         %[kg] Masse Anker
knee_Ra = knee_Um/knee_Is;              %[Ohm] Ankerwiderstand
knee_Jm = 1/2*knee_m*knee_r^2;          %[kg*m²] Trägheitsmoment des Motors
knee_Jg = 0.000000146;                  %[kg*m²] Trägheitsmoment des Getriebes
knee_inductance = knee_Ra*(134*1e-6);

knee_k = (knee_Um-knee_I0*knee_Ra)*60/(2*pi*knee_n0);   %[Vs = Nm/A] -> Motorkonstante

knee_Mrm = knee_k*knee_I0;              %[N.m] -> Reibmoment Motor
knee_Mra = knee_k*knee_Ia;              %[N.m] -> Haftreibmonent
knee_na = (knee_Us-knee_I0*knee_Ra)/knee_k;     %[rad/s] Anlaufdrehzahl

knee_i = 1/185.8428;                    %[-] Übersetzungsverhältnis
knee_Mrg = knee_k*knee_I0g;             %[N.m] -> Reibmoment mit Getriebe
knee_Mrhg = knee_k*knee_Iag;            %[N.m] -> Haftreibmoment mit Getriebe

IC_motor_knee_r = deg2rad(IC_phi_knee_r/knee_i);
IC_motor_knee_l = deg2rad(IC_phi_knee_l/knee_i);
IC_v_motor_knee = 0;
c_coupling_knee = 7/knee_Ra*knee_k/knee_i; %[Nm/°]
d_coupling_knee = 0.5;%[Nms/rad)



%*************************************************************
%MODELCRAFT MC-620 MG-T
%*************************************************************

hip_Um = 5;                             %[V]
hip_Us = 0.7;                           %[V] Anhaltespannung
hip_n0 = 13800;                         %[1/min] -> Leerlaufdrehzahl
hip_I0 = 0.066;                         %[A] -> Leerlaufstrom nur Motor
hip_I0g = 0.1;                          %[A] -> Leerlaufstrom mit Getriebe 
hip_Ia = 0.078;                         %[A] -> Anlaufstrom nur Motor
hip_Iag = 0.119;                        %[A] -> Anlaufstrom mit Getriebe
hip_Is = 0.91;                          %[A] -> Stillstandstrom
hip_nm = 10870;                         %[1/min] -> Drehzahl bei Mm
hip_Im = 0.25;                          %[A] -> Strom bei nm

hip_r = 0.005;                          %[m] Radius Anker
hip_m = 0.008;                          %[kg] Masse Anker
hip_Ra = hip_Um/hip_Is;                 %[Ohm] Ankerwiderstand
hip_Jm = 1/2*hip_m*hip_r^2;             %[kg*m] Trägheitsmoment des Motors
hip_Jg = 0.00000015;                    %[kg*m] Trägheitsmoment des Getriebes
hip_inductance = hip_Ra*(296*1e-6);

hip_k = (hip_Um-hip_I0*hip_Ra)*60/(2*pi*hip_n0);    %[Vs = Nm/A] -> Motorkonstante

hip_Mrm = hip_k*hip_I0;                 %[N.m] -> Reibmoment Motor
hip_Mrh = hip_k*hip_Ia;                 %[N.m] -> Haftreibmonent Motor
hip_na = (hip_Us-(hip_I0*hip_Ra))/hip_k;        %[rad/s] Anlaufdrehzahl

hip_i = 1/300.4858;                     %[-] Übersetzungsverhältnis
hip_Mrg = hip_k*hip_I0g;                %[N.m] -> Reibmoment mit Getriebe
hip_Mrhg = hip_k*hip_Iag;               %[N.m] -> Haftreibmoment mit Getriebe

% motor initial position
IC_motor_hip_r = deg2rad(IC_phi_hip_r/hip_i);
IC_motor_hip_l = deg2rad(IC_phi_hip_l/hip_i);
IC_v_motor_hip = 0;

% parameters elastic coupling
c_coupling_hip = 7/hip_Ra*hip_k/hip_i;
d_coupling_hip = .0000;  %[Nms/rad]





