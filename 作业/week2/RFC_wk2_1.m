clear
clc

%% step 1 Low Pass Filter
Rs = 50;
RL = 1e3;
f0 = 1e8;
wm = 2 * pi * f0;
L1 = Rs / (2 * pi * f0) * sqrt(RL / Rs - 1);
C1 = 1 / (2 * pi * f0 * RL) * sqrt(RL / Rs - 1);
s = 1e7 : 1e7 : 1e9;
H1 = 1 ./ (s * C1) ./ ( 1 ./ (s * C1) + s * L1);
% plot(s, H1)

%% step 2 High Pass Filter
Rs = 50;
RL = 1e3;
f0 = 1e8;
wm = 2 * pi * f0;
L2 = RL / (2 * pi * f0) / sqrt(RL / Rs - 1);
C2 = 1 / (2 * pi * f0 * Rs) / sqrt(RL / Rs - 1);
H2 = s * L2 ./ (1 ./ (s * C2) + s * L2);
% plot(s, H2);

%% step 3 Low Pass Filter TLine
c = 299792458;
w0 = 2 * pi * f0;
Z0_L = w0 * L1;
Z0_C = 1 / w0 / C1;
PVNC = 0.01;
lambda = PVNC * c / (f0 * 8);

%% step 4 High Pass Filter TLine
Z0_C_HP = 1 / (w0 * C2);
Z0_L_HP = w0 * L2;

%% step 5 Pi-size Low Pass Filter
f0 = 1e8;
w0 = 2 * pi * f0;
Rs = 10;
Rl = 1e3;
Ri = 2;
Q1 = Q(Rs, Ri);
Q2 = Q(Rl, Ri);
C1 = myCap(Q1, Rs, w0);
C3 = myCap(Q2, Rl, w0);
L = myInd(Q1, Ri, w0) + myInd(Q2, Ri, w0);
C1
L
C3

function bingdachuanxiaoQxiangdeng = Q(Rb, Rs)
    bingdachuanxiaoQxiangdeng = sqrt(Rb/Rs - 1);
end

function C = myCap(Q, R, w)
   C = Q / (w * R);
end

function L = myInd(Q, R, w)
    L = Q * R / w;
end