%2.3 Reconstruction

%Reconstruct 0.5fN
xrcon1 = reconstruct(t,x_sample1,0.5*fN);

%Figure 0.5fN
figure
subplot(2,1,1)
plot(t(1:length(xrcon1)),xrcon1)
xlabel('t')
ylabel('Amplitude')
title('Reconstructed 0.5fN')

%Reconstruct 2fN
xrcon2 = reconstruct(t,x_sample2,2*fN);

%Figure 2fN
subplot(2,1,2)
plot(t(1:length(xrcon2)),xrcon2)
xlabel('t')
ylabel('Amplitude')
title('Reconstructed 2fN')

%Function Reconstruct
function xrcon=reconstruct(t, x_sample, fs)

    %Number of samples after checking weather x_sample is even or odd
    if mod(length(x_sample), 2) == 0
        n = length(x_sample);
        remainder = 0;
    else
        n = (length(x_sample)-1)/2;
        remainder = 1;
    end
    
    %Reconstructing Interval
    Ts = 1/fs;

    %Reconstructing Values
    xrcon = zeros(1,length(t));

    for i=1:length(t)

        for k=-n:n

            %Sinc Value
            sinc_value = sinc(((t(i)/Ts)-k));

            %Reconstructed Signal
            if remainder==0
            xrcon(i) = xrcon(i) + x_sample(n+k) * sinc_value;
    
            else
                xrcon(i) = xrcon(i) + x_sample(n+k+1) * sinc_value;
            end
        end
    end
end

%As we can see the 2*fN is the better reconstruction because it accurately
%resembles the original signal since it is sampled at a higher frequency 
%however the 0.5*fN figure did not accurately resemble the original signal 
%so the oversampled is better since no data is lost and the undersampled is
%bad since a lot of the data was lost.

%Reconstruction cannot be perfect at any rate. 
%This is because the original signal is time-limited, meaning it has a 
%finite duration and bandwidth. As a result, the frequency content of the 
%signal is also limited, and there will always be some loss of information 
%when sampling and reconstructing the signal. This loss of information can 
%result in artifacts and distortions in the reconstructed signal, 
%particularly at higher frequencies. The amount of loss will depend on the 
%sampling rate and the bandwidth of the signal.