function[xn] = addnoise(x,nrms)

rmsx = norm(x)/sqrt(length(x));
noiserms = nrms*rmsx;

gaussnoise = randn(size(x));
gaussnoise = (sqrt(length(gaussnoise))/norm(gaussnoise))*gaussnoise*noiserms;

xn = x+gaussnoise;

end