%2.2 Sampling

load('Q2.mat')

%Nyquist Rate
fN = 2;

%Sample 0.5fN
[t_sample1, x_sample1] = sample(t,xt,0.5*fN);

%Figure 0.5fN
figure
subplot(2,1,1)
stem(t_sample1,x_sample1,'filled')
xlabel('t')
ylabel('Amplitude')
title('Undersampled 0.5fN')

%Sample 2fN
[t_sample2, x_sample2] = sample(t,xt,2*fN);

%Figure 2fN
subplot(2,1,2)
stem(t_sample2,x_sample2,'filled')
xlabel('t')
ylabel('Amplitude')
title('Oversampled 2fN')

%Function Sample
function [t_sample, x_sample]=sample(t, xt, fs)

%Sampling Interval
Ts = 1/fs;

%Sampling Times
t_sample = t(1):Ts:t(end);

%Sampled Signal
x_sample = interp1(t,xt,t_sample);
end

