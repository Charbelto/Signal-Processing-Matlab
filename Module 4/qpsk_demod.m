function b = qpsk_demod(x)
%QPSK demodulation
%We converted the binary digits to decimel
b = zeros(1, length(x));
for i = 1:length(x)
    if real(x(i)) >= 0 && imag(x(i)) >= 0
        b(i) = 3;
    elseif real(x(i)) < 0 && imag(x(i)) >= 0
        b(i) = 2;
    elseif real(x(i)) < 0 && imag(x(i)) < 0
        b(i) = 0;
    elseif real(x(i)) >= 0 && imag(x(i)) < 0
        b(i) = 1;
    end
end
end
