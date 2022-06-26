clear
clc

%% 第三题
% C = 10e-12;
% L = 10e-6;
% Q = 200;
% w0 = 1 / sqrt(L * C);
% f0 = w0 / (2 * pi);
% Z0 = sqrt(L / C);
% rs = Z0 / Q;
% Rp = Q^2 * rs;
% fp = 1 / (2 * pi) * w0 * sqrt(1 - 1 / Q^2);
% BW = fp / Q;

%% 第四题
L1 = 5e-6;
L2 = 5e-6;
Q = 100;
C1 = 8e-12;
C2 = 8e-12;
R0 = 40e3;
RL = 10e3;
fm = 1 / (2 * pi) * 1 / sqrt(L1 * C1) * sqrt(1 - 1 / Q^2);
Z = sqrt(2 * L1 / (C1 / 2));
Rp = Z * Q;
Ro = 40e3;
RLt = 40e3;
p1 = 1 / 2;
p2 = 1 / 2;
Zin = p1^2 * 1 / (1 / Ro + 1 / Rp + 1 / RLt);
Qp_RL = sqrt((C1 / 2) / (2 * L1)) / (1 / Rp + 1 / Ro + 1 / RLt);
Qp_noRL = sqrt((C1 / 2) / (2 * L1)) / (1 / Rp + 1 / Ro);
% W_RL = fm / Qp_RL;
% W_noRL = fm / Qp_noRL;

%% CAD部分
s = 1e7 : 1000 : 1e9;
L = L1 + L2
C = 1 / (1 / C1 + 1 / C2)
R = 1 / (1 / Rp + 1 / Ro + 1 / RLt)
Q =  R * sqrt(C / L)
w0 = 1 / (sqrt(L * C))
sys = abs(1 / Q * (s / w0) / ((s / w0).^2 + 1 / Q * (s / w0).^2 + 1));
plot(s, sys, 'r');
legend('幅频特性')




%% 第五题
% fs = 1e6;
% Vps = 0.1;
% fm = fs;
% wm = fs * 2 * pi;
% C_short = 1e-10;
% L = 1 / ((2 * pi * fm)^2 * C_short);
% Vpp_Cshort = 20;
% Q_short = Vpp_Cshort / (2 * Vps);
% rs = 1 / (wm * C_short * Q_short);
% V_ppCresistor = 5;
% Q_resistor = V_ppCresistor / (2 * Vps);
% RL = sqrt(L / C_short) / Q_resistor - rs;
