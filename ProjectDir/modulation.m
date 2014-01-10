function signal = modulation(bits) %gjør 0 om til -1
    signal = (bits*2-1)*sqrt(5);
end
%signalstyrke 5