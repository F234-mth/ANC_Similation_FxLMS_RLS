function w = fcn(v, e)
%#codegen
persistent wbuf vbuf
mu = 1e-6;
if isempty(wbuf)
    wbuf = zeros(1,8);
end
if isempty(vbuf)
    vbuf = zeros(1,8);
end
vbuf(2:8) = vbuf(1:7);
vbuf(1) = v;
wbuf = wbuf - mu * e * vbuf;
for k = 1:8 
    if ~isfinite(wbuf(k))
        wbuf(k) = 0;
    elseif wbuf(k) > 10
        wbuf(k) = 10;
    elseif wbuf(k) < -10
        wbuf(k) = -10;
    end
end
w = wbuf;
