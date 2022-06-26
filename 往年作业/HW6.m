clear
clc

s = tf('s');
syms ts As w0
H = (s * ts + 1) / (ts / (w0 * (1 + As)) * s^2 + (1 / w0 + ts / (1 + As)) * s + 1);
