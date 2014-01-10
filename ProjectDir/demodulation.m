function bits = demodulation(signal)
    bits = round((sign(signal) + 1)/2);
end