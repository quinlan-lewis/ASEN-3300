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

