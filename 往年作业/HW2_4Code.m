clear
clc

% L1 = 5e-6;
% L2 = L1;
% Q0 = 100;
% C1 = 8e-12;
% C2 = C1;
% R0 = 4e4;
% RL = 1e4;
% p1 = 1 / 2;
% p2 = 1 / 2;
% fm = 2.5163e7;
% Rp = Q0 * sqrt((L1 + L2) / (1 / ((1 / C1) + (1 / C2))));
% Rin = p1^2 * 1 / ( 1 / R0 + 1 / Rp + 1 / (RL / p1^2));
% Q = 1 / ( 1 / R0 + 1 / Rp + 1 / (RL / p1^2)) * sqrt( (1 / 2 * C1) / (L1 + L2));
% Q1 = 1 / ( 1 / R0 + 1 / Rp ) * sqrt( (1 / 2 * C1) / (L1 + L2) );
% BW0 = fm / Q
% BW1 = fm / Q1
% 
% f0 = 1e6;
% C = 100e-12;
% L = 1 / ((2 * pi * f0)^2 * C);
% Q = 100;
% rs = sqrt(L / C) / 100;
% RL = sqrt(L / C) / 25 - rs
%%以上为第二次作业T4， T5
%%
%%以下为第三次作业
% fm = 1e7;
% wm = 2 * pi * fm;
% Rs = 10;
% Rt = 100;
% Rl = 1000;
% L1 = Rs / wm * sqrt(Rt / Rs - 1);
% C1 = 1 / (wm * Rt) * sqrt(Rt / Rs - 1);
% L2 = Rl / wm / sqrt(Rl / Rt - 1)
% C2 = 1 / (wm * Rt) / sqrt(Rl / Rt - 1)

%%
%%以下为第四次作业

% part1 低通部分
% wp = 2 * pi * 3e3;
% ws = 2 * pi * 3e4;
% ap = 2;
% as = 35;
% n_min = (log10(10^(as / 10) - 1) - log10(10^(ap / 10) - 1)) / (2 * log10(ws / wp));
% wcmin = wp / (10^(ap / 10) - 1)^(1 / 4);
% wcmax = ws / (10^(as / 10) - 1)^(1 / 4);
% fcmin = wcmin / (2 * pi);
% fcmax = wcmax / (2 * pi);
% fc = 3.5e3;
% wc = 2 * pi * fc;
% g1 = 2 * sin(pi / 4);
% g2 = 2 * sin(3 * pi / 4);
% RG = 600;
% L = g1 * RG / wc * 1e3;
% C = g2 / (wc * RG) * 1e6;
% P0 = 2.083333e-4;
% P3 = 1.326295e-4;
% P30 = 3.666194e-8;
% apreal = 10 * log10(P3 / P0)
% asreal = 10 * log10(P30 / P0)

% part2 高通部分
RG = 600;
f0 = 6e3;
w0 = 2 * pi * f0;
ap = 2;
as = 35;
W = 6e3;
syms fp2 fp1
solve(fp2^2 - W * fp2 - f0^2==0);
solve(fp1^2 + W * fp1 - f0^2==0);
fp1 = 3000*5^(1/2) - 3000;
fp2 = 3000*5^(1/2) + 3000;
wp1 = 2 * pi * fp1;
wp2 = 2 * pi * fp2;
Bw = 1;
ws = 2 * pi * 30e3;
Wp = 1 / Bw * (wp2 / w0 - w0 / wp2);
Ws = 1 / Bw * (ws / w0 - w0 / ws);
n_min = (log10(10^(as / 10) - 1) - log10(10^(ap / 10) - 1)) / (2 * log10(Ws / Wp));
Wcmin = Wp / (10^(ap / 10) - 1)^(1 / 6);
Wcmax = Ws / (10^(as / 10) - 1)^(1 / 6);
Wc = 1.1;
g1 = 2 * sin(1 / 6 * pi);
g2 = 2 * sin(3 / 6 * pi);
g3 = 2 * sin(5 / 6 * pi);
L1 = g1 * RG / Wc;
C2 = g2 / (Wc * RG);
LS = L1 / (Bw * w0) * 1e3;
Cs = Bw / (w0 * L1) * 1e6;
Lp = Bw / (w0 * C2) * 1e3;
Cp = C2 / (Bw * w0) * 1e6;
P0 = 2.0833333e-4;
Pp1 = 1.321083e-4;
Pp2 = 1.332975e-4;
P30 = 3.018612e-8;
apreal1 = 10 * log10(Pp1 / P0)
apreal2 = 10 * log10(Pp2 / P0)
asreal = 10 * log10(P30 / P0)

%% 第五次作业

