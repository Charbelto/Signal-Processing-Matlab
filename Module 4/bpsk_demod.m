function b = bpsk_demod(x)
%BPSK demodulation
b = zeros(1, length(x));
for i = 1:length(x)
    if x(i) >= 0
        b(i) = 1;
    elseif x(i) < 0
        b(i) = 0;
    end
end
end
