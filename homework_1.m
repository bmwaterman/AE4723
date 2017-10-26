%% Problem 1
clear all; close all; clc; 

T_3048 = 268.3; % K
p_3048 = 0.9046; % kg/m^3

T_9144 = 228.71;% K
p_9144 = 0.4583; % kg/m^3

T_15240 = 216.65; %K
p_15240 = 0.1865; % kg/m^3

W = 325e3; % N
S = 88.26; % m^2
C_d0 = 0.015;
K = 0.08;
V = sym('V');

C_l1 = (2*W) / (p_3048 * (V^2) * S);
C_d1 = C_d0 + (K*C_l1^2);
lift_drag_ratio1 = C_l1 / C_d1;

C_l2 = (2*W) / (p_9144 * (V^2) * S);
C_d2 = C_d0 + (K*C_l2^2);
lift_drag_ratio2 = C_l2 / C_d2;

C_l3 = (2*W) / (p_15240 * (V^2) * S);
C_d3 = C_d0 + (K*C_l3^2);
lift_drag_ratio3 = C_l3 / C_d3;

lift_drag_ratio = [lift_drag_ratio1 , lift_drag_ratio2, lift_drag_ratio3];

fplot(lift_drag_ratio, [60.96 304.8]);
xlabel('velocity (m/s)');
ylabel('lift-to-drag ratio');
legend('3048 m', '9144 m', '15240 m');

%% Problem 2

T1 = W / lift_drag_ratio1;
T2 = W / lift_drag_ratio2;
T3 = W / lift_drag_ratio3;

T = [T1, T2, T3];

fplot(T, [60.96 304.8]);




