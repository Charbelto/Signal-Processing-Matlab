# MATLAB Digital Signal Processing & Communications Simulation

This repository contains a comprehensive suite of MATLAB scripts demonstrating fundamental principles of **Digital Signal Processing (DSP)** and **Digital Communications Systems**. The project is split into four distinct modules covering Fourier Analysis, Sampling and Reconstruction, Quantization, and Digital Modulation (BPSK/QPSK).

---

## 📋 Table of Contents
1. [Module 1: Fourier Analysis](#-module-1-fourier-analysis)
2. [Module 2: Sampling & Reconstruction](#-module-2-sampling--reconstruction)
3. [Module 3: Quantization & Noise Analysis](#-module-3-quantization--noise-analysis)
4. [Module 4: Digital Modulation (BPSK/QPSK)](#-module-4-digital-modulation-bpskqpsk)
5. [Prerequisites & Usage](#-prerequisites--usage)

---

## 🌀 Module 1: Fourier Analysis

This module implements the calculation and visualization of the **Discrete Fourier Series (DFS)** and the **Fast Fourier Transform (FFT)** for continuous signals. It explores how changing the number of sampling points $n$ and the period length $T$ affects frequency resolution and spectral leakage.

### Mathematical Formulation
The Fourier series representation of a periodic signal $x(t)$ with period $T$ is given by:

$$x(t) = a_0 + \sum_{k=1}^{\infty} \left( a_k \cos(k \omega_0 t) + b_k \sin(k \omega_0 t) \right)$$

where $\omega_0 = \frac{2\pi}{T}$ is the fundamental angular frequency, and the coefficients are computed as:

$$a_0 = \frac{1}{T} \int_{0}^{T} x(t) dt$$
$$a_k = \frac{2}{T} \int_{0}^{T} x(t) \cos(k \omega_0 t) dt$$
$$b_k = \frac{2}{T} \int_{0}^{T} x(t) \sin(k \omega_0 t) dt$$

### Key Scripts
*   `ffs.m`: Computes the coefficients $a_k$ and $b_k$ for a given input function and reconstructs the signal.
*   `Q1_2_Changing_n.m`: Analyzes how changing the number of harmonics $n$ affects the Gibbs phenomenon at signal discontinuities.
*   `Q1_3_Changing_T.m`: Explores the effect of changing the time period $T$ on the spacing of spectral lines in the frequency domain.

---

## 📈 Module 2: Sampling & Reconstruction

This module demonstrates the **Nyquist-Shannon Sampling Theorem** and signal reconstruction using interpolation functions.

### Nyquist Theorem
To reconstruct a band-limited continuous-time signal $x(t)$ with maximum frequency $f_{max}$ without aliasing, the sampling frequency $f_s$ must satisfy:

$$f_s \ge 2 f_{max}$$

### Signal Reconstruction
A sampled signal $x_s(t) = \sum_{n=-\infty}^{\infty} x(nT_s) \delta(t - nT_s)$ is reconstructed using a low-pass sinc interpolation filter:

$$x_{rec}(t) = \sum_{n=-\infty}^{\infty} x(nT_s) \text{sinc}\left(\frac{t - nT_s}{T_s}\right)$$

### Key Scripts
*   `Q2_1_Nyquist_Rate.m`: Simulates undersampling ($f_s < 2f_{max}$), critical sampling ($f_s = 2f_{max}$), and oversampling ($f_s > 2f_{max}$) to visualize spectral overlap.
*   `Q2_2_Sampling.m`: Generates sampled representations of analog input waveforms.
*   `Q2_3_Reconstructing.m`: Implements the sinc interpolation algorithm to reconstruct the continuous signal and calculates reconstruction error.

---

## 📊 Module 3: Quantization & Noise Analysis

This module models the conversion of continuous amplitude samples into discrete levels (Analog-to-Digital conversion) and analyzes **Signal-to-Quantization-Noise Ratio (SQNR)**.

### Uniform Quantization
For a uniform quantizer with $B$ bits (and thus $L = 2^B$ levels) mapping a signal with peak-to-peak range $V_{pp}$, the step size $\Delta$ is:

$$\Delta = \frac{V_{pp}}{2^B}$$

The quantization noise power $\sigma_q^2$ is modeled as uniform distribution error:

$$\sigma_q^2 = \frac{\Delta^2}{12} = \frac{V_{pp}^2}{12 \cdot 2^{2B}}$$

For a sinusoidal signal with power $P_s = \frac{A^2}{2}$, the SQNR is:

$$\text{SQNR}_{\text{dB}} \approx 6.02B + 1.76 \text{ dB}$$

### Key Scripts
*   `Q3_0_Quantization.m`: Core quantizer function mapping continuous inputs to discrete representation levels.
*   `Q3_1_Uniform_Quantization.m`: Simulates linear uniform quantization and plots quantization error vs. bit depth.
*   `Q3_2_Selective_Quantization.m`: Implements non-uniform quantization (such as $\mu$-law or A-law companding) to protect lower-amplitude components.

---

## 📡 Module 4: Digital Modulation (BPSK/QPSK)

This module implements baseband simulation of **Binary Phase Shift Keying (BPSK)** and **Quadrature Phase Shift Keying (QPSK)** over an Additive White Gaussian Noise (AWGN) channel.

### Signal Descriptions
*   **BPSK**: Maps 1 bit per symbol into two phases ($0$ and $\pi$):
    
    $$s(t) = A \cos(2\pi f_c t + \theta_i), \quad \theta_i \in \{0, \pi\}$$

*   **QPSK**: Maps 2 bits per symbol into four phases ($\frac{\pi}{4}, \frac{3\pi}{4}, \frac{5\pi}{4}, \frac{7\pi}{4}$):
    
    $$s(t) = A \cos(2\pi f_c t + \theta_i), \quad \theta_i \in \left\{ \frac{\pi}{4}, \frac{3\pi}{4}, \frac{5\pi}{4}, \frac{7\pi}{4} \right\}$$

### Key Scripts
*   `bpsk_mod.m` & `bpsk_demod.m`: Coherent modulator and demodulator functions for BPSK waveforms.
*   `qpsk_mod.m` & `qpsk_demod.m`: Coherent modulator and demodulator functions for QPSK constellations.
*   `Modulation_Test.m`: Main simulator generating random bitstreams, adding AWGN noise at varying $E_b/N_0$ ratios, demodulating the signals, and plotting the **Bit Error Rate (BER)** curves against theoretical benchmarks.

---

## 🚀 Prerequisites & Usage

### Prerequisites
*   MATLAB (R2018a or later recommended)
*   *Signal Processing Toolbox* (optional, but recommended)

### Running the Simulations
1.  Launch MATLAB and navigate to the project directory.
2.  Add the subfolders to the MATLAB path:
    ```matlab
    addpath('Module 1', 'Module 2', 'Module 3', 'Module 4')
    ```
3.  Run a specific module script (for example, the digital modulation simulator):
    ```matlab
    run('Module 4/Modulation_Test.m')
    ```
    This script will output the simulated BER curve compared to the theoretical curve:
    
    $$P_b = Q\left(\sqrt{\frac{2E_b}{N_0}}\right)$$
