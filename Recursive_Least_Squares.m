function w = fcn(v, e)
%#codegen
persistent wbuf vbuf P
N = 8;
delta = 100;

if isempty(wbuf)
    wbuf = zeros(N,1);
end

if isempty(vbuf)
    vbuf = zeros(N,1);
end

if isempty(P)
    P = delta * eye(N);
end

vbuf(2:N) = vbuf(1:N-1);
vbuf(1) = v;

den = 0.0037+ vbuf' * P * vbuf;
K = (P * vbuf) / den;

eps = -e - vbuf' * wbuf;

wbuf = wbuf + K * eps;

P = (eye(N) - K * vbuf') * P;

for i = 1:N
    if ~isfinite(wbuf(i))
        wbuf(i) = 0;
    end
end

w = wbuf.';