clear
clc

%% T1 C-class Power Amplifier
Im = 20;
theta = pi / 3;

I0 = Im * (sin(theta) - theta * cos(theta)) / (pi * (1 - cos(theta)));
VBB = 1;
RB = VBB / I0;
I1 = Im * (theta - sin(theta) * cos(theta)) / (pi * (1 - cos(theta)));


%% T2 C-class 3-time frequency Amplifier
Vth = 1;
Vim = 5;
VBB = Vth - Vim * cos(40 * pi / 180);
g = 10;
Icm = g * (Vim - Vth + VBB);
theta = 40 * pi / 180;
n = 3;
I3 = Icm * 2 * (sin(n * theta) * cos(theta) - n * cos(n * theta) * sin(theta)) / (n * pi * (n^2 - 1) * (1 - cos(theta)));

%% T4 Mixer
L2 = 0.685e-6;
C1 = 8.2e-12;
C2 = 10e-12;
L = L2;
C = 1 / (1 / C1 + 1 / C2);
wRF = 1 / sqrt(L * C);
wIF = 38e6;
wLO = wRF - wIF;

%% T6 MOSFET switch
Gp = (2 / pi)^2