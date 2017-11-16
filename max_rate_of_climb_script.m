clear all; close all; clc;
S = 950; % ftˆ2
CD0 = 0.015;
K = 0.08;
W = 73000; %lb

%Figure_3: Maximum rate of climb as a function of altitude for the Gulfstream IV aircraft.
rho_sl_SI = 1.225; % kg/mˆ3
rho_11K_SI = 0.3648; % kg/mˆ3
thrust_sl = 2 * 13850; % lb
R = 287; % J/kg.K
temperature_sl = 288.16; % K
temperature_11K = 216.78; % K
a1 = -6.5e-3; % K/m
g = 9.8; % m/sˆ2
lift_drag_max = 1 / sqrt(4*CD0*K);
wing_loading = W/S;
V_RC_max_rec= [];
RC_max_rec = [];
altitude_rec= [];
format shortE
for altitude = 10000:100:50000;
if altitude <= 36089
temperature = temperature_sl + a1*(altitude*0.3048);
rho_SI = rho_sl_SI * (temperature / temperature_sl)^(-1 - g/(a1*R));
else
rho_SI = rho_11K_SI * exp( -g*(altitude*0.3048 - 11000) ...
/ (R*temperature_11K) );
end
rho = rho_SI * 0.00194032;
thrust = thrust_sl * (rho_SI / rho_sl_SI);
thrust_weight = thrust / W;
Z = 1 + sqrt( 1 + 3 / (lift_drag_max^2 * thrust_weight^2) );
V_RC_max= sqrt( thrust_weight * wing_loading * Z / (3 * rho * CD0) );
dynp = 0.5 * rho * V_RC_max^2;
RC_max = V_RC_max * (thrust_weight - dynp * CD0 / wing_loading - ...
wing_loading * K / dynp);
V_RC_max_rec= cat(1, V_RC_max_rec,V_RC_max);
altitude_rec= cat(1, altitude_rec,altitude);
RC_max_rec = cat(1, RC_max_rec,RC_max);
disp([altitude RC_max]);
end
plot(altitude_rec, RC_max_rec, 'LineWidth', 2); grid on; hold on;
xlabel('Altitude (ft)'); ylabel ('RC_{max} (ft/s)')
plot([45700 46300], [1.67 0], '.', 'MarkerSize', 30);


