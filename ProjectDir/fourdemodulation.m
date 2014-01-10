function bits = fourdemodulation(signal) %gjør om 4pam til 2 og 2 bit
    %3=11, 1=01, -1=00, -3=10 (poenget er å flippe færrest mulig bit)
    bits = zeros(length(signal)*2, 1);
    for i=1:length(signal)
        if abs(signal(i))>2
            bits(2*i-1)=1;
        end
        if signal(i)>0
            bits(2*i)=1;
        end
    end
end
%denne her gir signalstyrke: 1/4(2*3^2+2*1^2)=5