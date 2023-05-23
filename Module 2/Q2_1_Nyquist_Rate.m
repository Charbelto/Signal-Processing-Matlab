%2.1 Nyquist Rate

%The Nyquist-Shannon sampling theorem states that to accurately capture and
%reproduce a continuous-time signal in a discrete-time domain, the signal 
%must be sampled at a rate that is at least twice the maximum frequency it
%contains. In other words, the sampling rate must be greater than or equal
%to twice the highest frequency component of the signal, also known as the
%Nyquist Rate, to prevent aliasing and ensure perfect signal 
%reconstruction.

%In the case of a signal with a maximum frequency of f0, the Nyquist Rate 
%for perfect signal reconstruction is given by fN = 2f0 = 2 Hz for this 
%problem. This means that the signal must be sampled at a rate of at least
%2f0 samples per second to accurately represent the original signal in the
%discrete-time domain. Any sampling rate less than the Nyquist Rate can 
%lead to aliasing, where high-frequency components of the signal are 
%misrepresented as lower-frequency components in the sampled signal, 
%leading to distortion and inaccuracies.

