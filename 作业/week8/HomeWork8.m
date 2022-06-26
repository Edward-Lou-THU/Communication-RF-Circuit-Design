clear
clc

t = 0 : 0.01 : 10;
T = 5;
A = 1;
wc = 2 * pi / T;
Vcm = 1;
KF = 1;
vf1 = A * square(wc * t);
vf2 = zeros(length(t), 1);
vf3 = zeros(length(t), 1);
vf4 = A * sin(wc * t);
T = T * 100;
VFM1 = zeros(length(t), 1);
VFM2 = zeros(length(t), 1);
VFM3 = zeros(length(t), 1);
VFM4 = zeros(length(t), 1);
for k = 1 : length(t)
    if(k - T * floor(k / T)) > T / 4 && (k - T * floor(k / T)) < T / 2
        vf2(k) = A;
    end
    if ((k - T * floor(k / T)) > 3 * T / 4) && ((k - T * floor(k / T)) < T)
        vf2(k) = -A;
    end
end
T = T / 100;
nabla = A / (T / 2) / 100;
T = T * 100;
for k = 1 : length(t)
    vf3(k) = nabla * k - 2 * A * ceil((k - T / 2) / T);
end
T = T / 100;

%% 调频波输出
for p = 1 : length(t)
    VFM1(p) = Vcm * cos(wc * p * 0.01 + KF * MyInt(vf1, p, length(t), 0.01));
    VFM2(p) = Vcm * cos(wc * p * 0.01 + KF * MyInt(vf2, p, length(t), 0.01));
    VFM3(p) = Vcm * cos(wc * p * 0.01 + KF * MyInt(vf3, p, length(t), 0.01));
    VFM4(p) = Vcm * cos(wc * p * 0.01 + KF * MyInt(vf4, p, length(t), 0.01));
end

% plot(t, VFM1)

%% 瞬时频率输出

w1 = wc + KF * vf1;
w2 = wc + KF * vf2;
w3 = wc + KF * vf3;
w4 = wc + KF * vf4;
% 
% plot(t, w1);

%% 瞬时相位输出
P1 = zeros(length(t), 1);
P2 = zeros(length(t), 1);
P3 = zeros(length(t), 1);
P4 = zeros(length(t), 1);
for p = 1 : length(t)
    P1(p) = wc * p * 0.01 + KF * MyInt(vf1, p, length(t), 0.01);
    P2(p) = wc * p * 0.01 + KF * MyInt(vf2, p, length(t), 0.01);
    P3(p) = wc * p * 0.01 + KF * MyInt(vf3, p, length(t), 0.01);
    P4(p) = wc * p * 0.01 + KF * MyInt(vf4, p, length(t), 0.01);
end

% plot(t, P1);

Sigma = [0.7,0.2; 0.2, 1.2]
mu1 = [1, 0]
mu2 = [2, 0]
syms x1  x2
x = [x1, x2]


function out = MyInt(f, idx, idxMax, dx)
    out = 0;
    if idx > idxMax
        error("Invalid Idx");
    end
    if idx <= 1
        out = 0;
    else 
        for p = 1 : idx
            out = out + f(p) * dx;
        end
    end
end