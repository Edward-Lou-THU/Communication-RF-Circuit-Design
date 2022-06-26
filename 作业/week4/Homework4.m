clear
clc

%% T3
Gm1 = 10^(6 / 10);
Gm2 = 10^(12 / 10);
Gm3 = 10^(20 / 10);
F1 = 1.7;
F2 = 2.0;
F3 = 4.0;
A = [Gm1, F1];
B = [Gm2, F2];
C = [Gm3, F3];
Fn1 = Fn(C, A, B);
Fn2 = Fn(C, B, A);
Fn3 = Fn(A, B, C);
Fn4 = Fn(B, A, C);
Fn5 = Fn(A, C, B);
Fn6 = Fn(B, C, A);

%% T4
Vcc = 10;
R = 2e4;
Vth = 0.7;
ID = (Vcc - Vth) / R;
q = 1.602e-19;
k = 1.38064852e-23;
T = 290;
BW = 1e5;
va2 = 2 * q * ID * BW * R^2 + 4 * k * T * R * BW;
va = sqrt(va2);

%% T5
Rs = 1e5;
Gs = 1 / Rs;
VnA = 10e-9;
VnB = 10e-9;
InA = 50e-12;
InB = 100e-12;
RnA = VnA^2 / (4 * k * T);
RnB = VnB^2 / (4 * k * T);
GuA = InA^2 / (4 * k * T);
GuB = InB ^2 / (4 * k * T);
GsAopt = sqrt(GuA / RnA);
GsBopt = sqrt(GuB / RnB);
FnA = (1 + 2 * sqrt(RnA * GuA)) + ...
       RnA * abs(Gs + GsAopt^2 / Gs - 2 * GsAopt);
FnB = (1 + 2 * sqrt(RnB * GuB)) + ...
       RnB * abs(Gs + GsBopt^2 / Gs - 2 * GsBopt);
   
%% T6
VB = -2;
Vth = 1;
Vim = 5.2;
Im = 22;
theta = acos((Vth - VB) / Vim);
I0 = Im * (sin(theta) - theta * cos(theta)) / (pi * (1 - cos(theta)));
I1 = Im * (theta - sin(theta)* cos(theta)) / (pi * (1 - cos(theta)));
I2 = Im * 2 * (sin(2 * theta) * cos(theta) - 2 * cos(2 * theta) * sin(theta)) / (2 * pi * 3 * (1 - cos(theta)));

%% T7




function F = Fn(O1, O2, O3)
    F = O1(2) + (O2(2) - 1) / O1(1) + (O3(2) - 1) / (O1(1) * O2(1));
end