%% Problem 1
clear all; close all; clc; 

T_3048 = 268.3; % K
rho_3048 = 0.9046; % kg/m^3

T_9144 = 228.71;% K
rho_9144 = 0.4583; % kg/m^3

T_15240 = 216.65; %K
rho_15240 = 0.1865; % kg/m^3

W = 325e3; % N
S = 88.26; % m^2
C_d0 = 0.015;
K = 0.08;
V = sym('V');

C_l1 = (2*W) / (rho_3048 * (V^2) * S);
C_d1 = C_d0 + (K*C_l1^2);
lift_drag_ratio1 = C_l1 / C_d1;

C_l2 = (2*W) / (rho_9144 * (V^2) * S);
C_d2 = C_d0 + (K*C_l2^2);
lift_drag_ratio2 = C_l2 / C_d2;

C_l3 = (2*W) / (rho_15240 * (V^2) * S);
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
xlabel('velocity (m/s)');
ylabel('Thrust required for steady trim');
legend('3048 m', '9144 m', '15240 m');

%% Problem 3


%% Problem 4
h = sym('h');

Temp = piecewise(h < 11000,288.16 + (-6.5e-3*h),h > 11000, 216.6);
rho = piecewise (h < 11000,1.225*(Temp/288.16)^(-1 -(9.8/(-6.5e-3*287))),h > 11000, 0.3642 * exp((-9.8*(h-11000))/(287*216.6)));

rho_0 = 1.225;
Th_0 = 1.23e5; 
Th = (rho/rho_0) * Th_0;

LD_max = 14.43;
W = 3.25e5;
S = 88.26;
C_d0 = 0.015;
TW_ratio = Th / W;
WS_loading = W / S;
z = 1 + sqrt(1 + (3 / ((LD_max^2) * (TW_ratio^2))));
RC_max = sqrt((WS_loading * z)/(3 * rho * C_d0)) * (TW_ratio^(3/2)) * (1 - (z/6) - (3 / ((LD_max^2) * (TW_ratio^2))))
plot = [RC_max, 0];

fplot(RC_max, [0 100000])
ylim([-1 60]);
xlabel('altitude (h)');
ylabel('RC_max');
legend('RC_max vs. altitude');

f1a=RC_max;
f2a=0;
f3a = 0.508; % 100 ft/min converted to m/s
find(f1a==f2a)

absolute_ceiling = find(f1a==f2a)
service_ceiling = find(f1a==f3a)

%% Problem 5 













