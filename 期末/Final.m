clear
clc

L1 = 20e-6;
C2 = 7e-12;
C3 = C2;
C5 = 4e-12;
CD = 2e-12;
CDmin = 1e-12;
CDmax = 4e-12;
Cb1 = C2 * C3 / (C2 + C3);
Cb2 = C5 * CD / (C5 + CD);
Cb2min = C5 * CDmin / (C5 + CDmin);
Cb2max = C5 * CDmax / (C5 + CDmax);
f = 1 / (2 * pi * sqrt(L1 * (Cb1 + Cb2)));
f_max = 1 / (2 * pi * sqrt(L1 * (Cb1 + Cb2min)))
f_min = 1 / (2 * pi * sqrt(L1 * (Cb1 + Cb2max)))
deltaf_up = f_max - f
deltaf_down = f - f_min;

T = 20 / pi;
-atan(5 * pi / 40) * 360 / (2 * pi);
asin(5 * pi / 40) * 360 / (2 * pi);
0.9308 * 0.5