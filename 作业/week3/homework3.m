clear
clc

Vcc = 24;
Vc_sat = 1;
Psat = 2;
RL_opt = (Vcc - Vc_sat)^2 / (2 * Psat);
R1 = RL_opt;
fc = 5e7;
wc = 2 * pi * fc;
QL = 10;
R2 = 200;

syms C1 C2 L1
e1 = 1 / sqrt(L1 * (C1 * C2 /(C1 + C2))) - wc;
e2 = R2 * sqrt((C1 * C2 /(C1 + C2)) / L1) - QL;
e3 = (C2 / (C1 + C2))^2 - R1 / R2;
[C10, C20, L10] = solve(e1, e2, e3, C1, C2, L1);
double([C10, C20, L10])