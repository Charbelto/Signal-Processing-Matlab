%1.3 Changing T

load('Q1_3.mat');

% Define u(t)
ut = sin(2*pi*t) + sin(6*pi*t);
ut(abs(t) >= 1) = 0;

% Plot u(t)
figure;
plot(t, ut, 'LineWidth', 2);
xlabel('t');
ylabel('u(t)');
title('u(t)')

% Find smallest n and T
nmin = 6;
Tvalues = 0:0.5:6;
errors = zeros(1, length(Tvalues));

% Calculate Error
for i = 1:length(Tvalues)
    [uh, ~] = ffs(ut, t, nmin, Tvalues(i));
    errors(i) = trapz(t, abs(ut - real(uh)).^2);
end

% Plot Error
figure;
plot(Tvalues, errors, 'LineWidth', 2);
xlabel('T Values');
ylabel('Error (Square Error)');
title('Variation Of Square Error As A Function Of T Values')

%The smallest value of T for which the square error is zero is T=2.

%All coefficients in the Fourier series of u(t) have non-zero values when n
%goes to infinity. The Fourier series converges slowly as a result of the
%sharp discontinuities in u(t) at t = |1|. Since the slow convergence 
%prevents the Fourier coefficients from decaying to zero as n rises, all of
%the coefficients help to approximate u(t). However, the higher frequency 
%components have less of an effect on the signals overall structure 
%because the coefficients amplitudes decline with frequency.

