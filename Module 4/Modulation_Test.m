%Modulation Test
bits = 10000;
%Set energy per symbol and amplitude
Es = 2;
A = sqrt(Es);

%Generate a random bit stream of 1's and 0's for bpsk
b_bpsk = randi([0 1], 1, bits);
%Modulate the bit stream using BPSK
b_bpsk_modulated = bpsk_mod(b_bpsk, A);
%Demodulate the bit stream using BPSK
b_bpsk_demodulated = bpsk_demod(b_bpsk_modulated);
%Check if the recovered BPSK bit stream is equal to the original
isequal(b_bpsk, b_bpsk_demodulated) %It should return 1

%Generate a random bit stream of 3's and 2's and 1's and 0's for qpsk since
%these correspond to the 2 binary digits in decimel
b_qpsk = randi([0 3], 1, bits);
%Modulate the bit stream using QPSK
b_qpsk_modulated = qpsk_mod(b_qpsk, A);
%Demodulate the bit stream using QPSK
b_qpsk_demodulated = qpsk_demod(b_qpsk_modulated);
%Check if the recovered QPSK bit stream is equal to the original
isequal(b_qpsk, b_qpsk_demodulated) %It should return 1

%Add AWGN to the modulated signal of QPSK
SNR_vector = 0:1:1000;
biterrorrate_vector_qpsk = 0:1:1000;
biterrorrate_vector_bpsk = 0:1:1000;
for i = 1:length(SNR_vector)
    %Calculate SNR in dB
    SNR = 10^(SNR_vector(i)/10);
    
    n_zeros = zeros(1, length(b_qpsk_modulated));
    %Generate n
    n = awgn(n_zeros, SNR);
    
    y_qpsk = b_qpsk_modulated + n;
    y_qpsk_demodulated = qpsk_demod(y_qpsk);
    %Calculate Bit Error Rate For QPSK After Noise
    biterrorrate_qpsk = mean(b_qpsk ~= y_qpsk_demodulated);
    biterrorrate_vector_qpsk(i) = biterrorrate_qpsk;

    y_bpsk = b_bpsk_modulated + n;
    y_bpsk_demodulated = bpsk_demod(y_qpsk);
    %Calculate Bit Error Rate For BPSK After Noise
    biterrorrate_bpsk = mean(b_bpsk ~= y_bpsk_demodulated);
    biterrorrate_vector_bpsk(i) = biterrorrate_bpsk;   
end

figure
semilogy(SNR_vector, biterrorrate_vector_qpsk)
xlabel('SNR');
ylabel('Bit Error Rate')
title('QPSK Modulation  With Noise')
grid on;

figure
semilogy(SNR_vector, biterrorrate_vector_bpsk)
xlabel('SNR');
ylabel('Bit Error Rate')
title('BPSK Modulation  With Noise')
grid on;
