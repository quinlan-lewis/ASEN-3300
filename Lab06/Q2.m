clear all; clc; close all;

Vin = 1.6; %[Vpp]
Vout = [8.04; 8.04; 8; 7.40; 6.75; 6.32; 6.16; 6.04; 6.04; 6; 5.36];
gain = 20*log10(Vout/Vin);
freq = [10; 20; 50; 100; 200; 500; 1000; 2000; 5000; 10000; 20000];

figure()
semilogx(freq(1:3),gain(1:3),freq(4:6),gain(4:6),freq(7:9),gain(7:9),freq(10:11),gain(10:11))