clear
clc

RS = 600;
RL = 600;
f0 = 6e3;
w0 = 2 * pi * f0;
f1 = 3.7082e3;
f2 = 9.7082e3;
f3 = 30e3;
w1 = 2 * pi * f1;
w2 = 2 * pi * f2;
w3 = 2 * pi * f3;
ap = 2;
as = 35;
Bw = (f2 - f1) / f0;
OmegaP1 = NormalizedOmega(Bw, w0, w1);
OmegaP2 = NormalizedOmega(Bw, w0, w2);
OmegaS1 = NormalizedOmega(Bw, w0, w3);
OmegaP = max(OmegaP1, OmegaP2);
OmegaS = OmegaS1;
Nmin = log10((10^(as / 10) - 1)/(10^(ap / 10) - 1)) / (2 * log10(OmegaS / OmegaP));
N = ceil(Nmin);
OmegaCmin = OmegaP / (10^(ap / 10) - 1)^(1 / (2 * N));
OmegaCmax = OmegaS / (10^(as / 10) - 1)^(1 / (2 * N));
OmegaC = (OmegaCmin + OmegaCmax) / 2;
g = zeros(1, N);
for k = 1 : N
    g(k) = 2 * sin((2 * k - 1) * pi / (2 * N));
end
Lp1_Proto = g(1) * RS / OmegaC;
Lp2_Proto = g(3) * RS / OmegaC;
Cp1_Proto = g(2) / (OmegaC * RS);
Ls1 = Lp1_Proto / (Bw * w0);
Cs1 = Bw / (w0 * Lp1_Proto);
Lp2 = Bw / (Cp1_Proto * w0);
Cp2 = Cp1_Proto / (w0 * Bw);
Ls3 = Lp2_Proto / (Bw * w0);
Cs3 = Bw / (w0 * Lp2_Proto);
v0 = 500e-3;
ap1 = abs(20 * log10(398.2865e-3 / v0))
ap2 = abs(20 * log10(424.1371e-3 / v0))
as = abs(20 * log10(7.588475e-3 / v0))


function Omega = NormalizedOmega(Bw, w0, w)
    f = 1 / Bw * (w / w0 - w0 / w);
    Omega = f;
end