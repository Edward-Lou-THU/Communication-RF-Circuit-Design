clear
clc

%% Homework 1
syms w t
x = cos(t) + cos(2 * t);
X = pi * (dirac(w + 1) + dirac(w - 1)) + pi * (dirac(w + 2) + dirac(w - 2));
% H1 = cos(pi * w / 2) - 1i * sin(pi * w / 2);
H2 = w * cos(pi * w / 2) - w * 1i * sin(pi * w / 2);
% H3 = -1i;
Y = X * H2;
y = ifourier(Y, t);
% 
tmpT = 0 : 0.01 : 20;
oX = cos(tmpT) + cos(2 * tmpT);
% oY1 = -(- pi*exp(-tmpT*1i)*1i + pi*exp(tmpT*1i)*1i + pi*exp(-tmpT*2i) + pi*exp(tmpT*2i))/(2*pi);
oY2 = -(pi*exp(-tmpT*1i)*1i + pi*exp(tmpT*1i)*1i - 2*pi*exp(-tmpT*2i) + 2*pi*exp(tmpT*2i))/(2*pi);
% oY3 = -(pi*(exp(-tmpT*1i) + exp(tmpT*1i))*1i + pi*(exp(-tmpT*2i) + exp(tmpT*2i))*1i)/(2*pi);
% 
figure
plot(tmpT, oX, 'g',tmpT, oY2, 'r')
legend('Input Signal', 'Output Signal(Amplitude)', 'Location', 'NorthEast')

%% HomeWork 2
syms w0 t p1 p2 w
x = cos(w0 * t);
X = fourier(x, t, w);
y2 = cos(2 * w0 * t + p2);
Y2 = fourier(y2, t, w);
H = Y2 / X;

