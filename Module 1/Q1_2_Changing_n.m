%1.2 Changing n

load('Q1_2.mat');

% Define x(t) and T
T = 2;
xt = 1 - abs(t);
xhat = cell(1, 4);

% Define Values Of n To Use For Approximations
nvalues = [1, 2, 4, 8];

% Calculate Approximations Using Ffs 
for i = 1:length(nvalues)
    [xhat{i}, ~] = ffs(xt, t, nvalues(i), T);
end

% Plot x(t) Approximations For Different Values Of n
figure;
plot(t, xt, 'k', 'LineWidth', 2);
hold on;

for i = 1:length(nvalues)
    plot(t, real(xhat{i}), 'LineWidth', 2);
end

legend('x(t)', 'n=1', 'n=2', 'n=4', 'n=8');
xlabel('t');
ylabel('x(t) and xhat(t)');
title('Approximations Of x(t) and xhat(t)')

% Calculate Error Between x(t) and Its Approximations
nmax = 20;
errors = zeros(1, nmax);

for n = 1:nmax
    [xh, ~] = ffs(xt, t, n, T);
    errors(n) = trapz(t, abs(xt - real(xh)).^2);
end

% Plot Error
figure;
plot(1:nmax, errors, 'LineWidth', 2);
xlabel('n Values');
ylabel('Error (Square Error)');
title('Variation Of Square Error As A Function Of n Values')
