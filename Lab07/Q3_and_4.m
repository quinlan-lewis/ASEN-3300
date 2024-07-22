%Prelab 7 - Questions 3 and 4
%author: Quinlan Lewis
%Date modified: 3/8/21

clear all; clc; close all

v_convert = [0; .25; .5; .75; 1; 1.25; 1.5; 1.75; 2; 2.25; 2.5; 2.75; 3; 3.25];
bits = [4; 8; 12];
max_v = 3.3;
min_v = 0;

[Bin_dec, ~] = Voltage2Bin(min_v,max_v,bits(1),v_convert);
figure()
plot(v_convert, Bin_dec)
xlabel('Voltage'); ylabel('Bins'); title('Bits = 4')

[Bin_dec, ~] = Voltage2Bin(min_v,max_v,bits(2),v_convert);
figure()
plot(v_convert, Bin_dec)
xlabel('Voltage'); ylabel('Bins'); title('Bits = 8')

[Bin_dec, ~] = Voltage2Bin(min_v,max_v,bits(3),v_convert);
figure()
plot(v_convert, Bin_dec)
xlabel('Voltage'); ylabel('Bins'); title('Bits = 12')

bit = 12;
Vmax = (3.3/2) + 1.65;
Vmin = 0;
V_step = (Vmax-Vmin)/(2^bit);

arr1 = 1.65:V_step:Vmax;
arr2 = Vmax:-V_step:0;
arr3 = 0:V_step:1.65;
arrtest = 0:V_step:3.3;

arr = [arr1, arr2, arr3];
[Bin_dec, ~] = Voltage2Bin(min_v,max_v,12,arr);
Bin_dec = Bin_dec(Bin_dec~=0);
figure()
plot(Bin_dec)
xlabel('Voltage'); ylabel('Bins'); title('Bits = 12, Question 4')

function [Bin_dec, Bin_bin] = Voltage2Bin(min_v,max_v,bits,v_convert)
V_range = max_v - min_v;
LSB = V_range/(2^bits);
V_range_check = 0:LSB:(3.3-LSB);

bins = 0:(2^bits - 1);
for i = 1:length(v_convert)
    for j = 2:length(V_range_check)
        if (v_convert(i) > V_range_check(j-1)) && (v_convert(i) < V_range_check(j))
            out(i) = bins(j-1);
        elseif v_convert(i) >= V_range_check(end)
            out(i) = bins(end);
        end
    end
end

Bin_dec = out;

for i = 1:length(out)
    Bin_bin(i) = str2double(dec2bin(out(i)));
end

end