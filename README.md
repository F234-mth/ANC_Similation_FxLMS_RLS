# ANC_Simulation_FxLMS_RLS

## Overview

This project presents a comparative study of two adaptive filtering algorithms—**Filtered-x Least Mean Squares (FxLMS)** and **Recursive Least Squares (RLS)**—for active noise cancellation (ANC) and speech enhancement.

The system is implemented in MATLAB/Simulink and evaluates the performance of both algorithms using real audio signals. The goal is to analyze their convergence behavior, steady-state performance, and suitability for practical applications such as communication and daily audio processing.

---

## System Model

The adaptive noise cancellation system is based on a classical structure:

The primary signal is:
  
d(n) = s(n) + v(n)

where:

- s(n): clean speech  
- v(n): noise  

The reference signal x(n) is correlated with the noise component.

The adaptive filter produces:

y(n) = w^T(n) x(n)

and the residual error is:

e(n) = d(n) - y(n)

Ideally:

e(n) ≈ s(n)

so that the error signal becomes the denoised speech output.

---

## Algorithms

### 1. FxLMS

The Filtered-x LMS algorithm updates the adaptive filter coefficients using a gradient-based approach:

w(n+1) = w(n) - μ v(n) e(n)

where:

- μ is the step size  
- v(n) is the filtered reference signal  

**Characteristics:**

- low computational complexity  
- stable with proper step size  
- slower convergence  
- lower steady-state error  

---

### 2. Recursive Least Squares (RLS)

The RLS algorithm minimizes the cumulative squared error using recursive estimation:

K(n) = P(n-1) x(n) / [λ + x^T(n) P(n-1) x(n)]

w(n) = w(n-1) + K(n) e(n)

P(n) = [P(n-1) - K(n) x^T(n) P(n-1)] / λ

where:

- K(n): gain vector  
- P(n): inverse covariance matrix  
- λ: forgetting factor  

**Characteristics:**

- very fast convergence  
- higher computational complexity  
- sensitive to noise and modeling mismatch  
- may exhibit steady-state oscillation  

---

## Results and Discussion

### Convergence Comparison

- **RLS** converges significantly faster during the initial stage due to its use of second-order statistics.
- **FxLMS** converges more slowly because it relies on gradient descent with a fixed step size.

### Steady-State Behavior

- **FxLMS** gradually reduces the error and can approach zero.
- **RLS** tends to remain within a small range and does not fully converge to zero.

### Explanation

FxLMS performs small incremental updates, which leads to:

- smoother convergence  
- reduced oscillation  
- lower final error  

RLS performs aggressive updates using adaptive gain, which results in:

- rapid convergence  
- sensitivity to noise and mismatch  
- bounded oscillation around the optimal solution  

---

## Applications

This project is relevant to:

- noise-canceling headphones  
- speech enhancement systems  
- teleconferencing and meeting applications  
- hearing assistive devices  

---

## To Do List

1. Replace the random input signal with real speech recordings to evaluate performance under realistic conditions.

2. Compare the residual error outputs of FxLMS and RLS, and determine which algorithm produces clearer speech and better audio quality for practical use such as meetings and daily communication.

3. Develop a hardware prototype using Arduino Nano 33 and microphones to implement a wearable noise-cancellation system.

---

## Conclusion

This project demonstrates the trade-off between FxLMS and RLS algorithms:

- FxLMS provides better steady-state accuracy but slower convergence.
- RLS achieves fast convergence but exhibits steady-state fluctuation.

The choice of algorithm depends on the application requirements, particularly the balance between convergence speed and residual noise performance.

---

## Author

Chenxin Zhang  
Department of Electrical and Computer Engineering  
Michigan State University  
