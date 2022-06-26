clear
clc

R1 = 1e8;
R2 = 1e0;
R3 = 1e5;
C1 = 1e-6;
C2 = 1e-3;
C3 = 1e-2;
a1 = [1i * R1 * C1, 1];
a2 = [1i * R2 * C2, 1];
a3 = [1i * R3 * C3, 1];
a = conv(a1, conv(a2, a3));
b1 = [R1 * C1, 1];
b2 = [R2 * C2, 1];
b3 = [R3 * C3, 1];
b = conv(b1, conv(b2, b3)) + ...
    [0, ...
    2 * R1 * C3 * (R2 * C1 + R2 * C2 + R3 * C2),...
    2 * (R1 * C2 + R2 * C3 + R1 * C3), ...
    0];
w = logspace(-6, 6);
h = freqs(a, b, w);
mag = abs(h);
plot(log10(w), 20 * log10(mag))
grid on
xlabel('Frequency (M rad/s)')
ylabel('Amplitude')

