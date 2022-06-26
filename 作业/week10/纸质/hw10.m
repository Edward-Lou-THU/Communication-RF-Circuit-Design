clear
clc

t = 0 : 0.01 : 10;
wc = 10;
Omega = 1;
mF = 1;
tau0dw = pi * 3 / 4;
Vo = - 1 / 2 * [sin(2 * wc .* t) + 2 * mF * sin(Omega .* t) - tau0dw * cos(Omega .* t)] - 1 / 2 * sin(tau0dw * cos(Omega .* t));
plot(t, Vo);
xlabel('time');
ylabel('Timer Output');
