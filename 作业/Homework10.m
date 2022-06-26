clear
clc

wi = 2.005 * 1e6 * pi;
wo = 2 * pi * 1e6;
dw = wi - wo;
Kp = dw / sin(0.5);
Omega = 2 * pi * 1e3;
mf = 0.5;
A = mf * sqrt(( Omega * Omega )/( Omega * Omega + Kp * Kp));
phi = pi / 2 - atan(Omega/Kp);

BW = Kp * cos(0.5) / (2 * pi);

R = 1e4;
C = 1e-8;
Kw = 3e6;
Kd = 4;
tau = R * C;
Kp = Kw * Kd;
wn = sqrt(Kp / tau);
xi = 1 / (2 * wn * tau);
BW = 2 * xi * wn / (2 * pi);

tau2Omega = tan(65 * 2 * pi / 360);
x = tau2Omega;
xi = 0.5 * sqrt(1 / sqrt(1 + x * x)) * x
