function x = qpsk_mod(b, A)
%QPSK modulation
%We converted the binary digits to decimel
x = zeros(1, length(b));
for j = 1:length(b)
    if b(j) == 3
        x(j) = (A/sqrt(2)) * (1+1i);
    elseif b(j) == 2
        x(j) = (A/sqrt(2)) * (-1+1i);
    elseif b(j) == 0
        x(j) = (A/sqrt(2)) * (-1-1i);
    elseif b(j) == 1
        x(j) = (A/sqrt(2)) * (1-1i);
    end
end
end