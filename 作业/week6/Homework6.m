clear
clc

Q = 50;
f0 = 5e7;
syms f
solve(Q * (f / f0 - f0 / f) ==  1 / sqrt(3));

%% Q3
C1 = 2500e-12;
C2 = 2 * 1600e-12;
C3 = 50e-12;
C = 1 / (1 / C1 + 1 / C2 + 1 / C3);
L = 50e-6;
f = 1 / (2 * pi * sqrt(L * C));
F = C1 / (C1 + C2);

%% Q4
C1 = 510e-12;
C2 = 2200e-12;
C = C1 * C2 / (C1 + C2);
F = -C1 / C2;
f = 5e5;
L = 1 / ((2 * pi * f)^2 * C);
