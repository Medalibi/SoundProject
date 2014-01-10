function noisesignal = noise(signal, var)
    gaussnoise = sqrt(var).*randn(size(signal));
    noisesignal = signal + gaussnoise;
end