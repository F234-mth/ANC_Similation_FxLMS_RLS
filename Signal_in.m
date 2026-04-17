[d, fs] = audioread('output.wav');
[v, fs2] = audioread('noise_reference.wav');

if fs ~= fs2
    error('Sampling rates must match.');
end

L = min(length(d), length(v));
d = d(1:L);
v = v(1:L);

Ts = 1/fs;
t = (0:L-1)' * Ts;

signalin = timeseries(d, t);   % noisy signal
noisein  = timeseries(v, t);   % reference noise