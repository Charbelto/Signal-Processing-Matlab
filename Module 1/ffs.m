%1.1 Fourier Series Implementation
function [xhat, ck] = ffs(xt, t, n, T)
    %Initializes Vector ck
    ck = zeros(1, 2*n+1);

    %Initializes Vector xhat
    xhat = zeros(1,length(t));

    %Loop that iterates from -n to n totalling 2n+1 iterations
    for k = -n:n

        %Variable from 1 to 2n+1
        var = k + n + 1;

        %Computing ck coefficients
        ck(var) = (1/T) * trapz(t, xt .* exp(-2 * pi *1i* k * t / T));

        %Computng xhat coefficients
        xhat = xhat + ck(var) * exp(2 * pi * 1i * k * t / T);
    end
end