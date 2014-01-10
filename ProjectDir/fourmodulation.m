function signal = fourmodulation(bits) %gjør om 2 og 2 bit til 4pam
    %11=3, 01=1, 00=-1, 10=-3 (poenget er å flippe færrest mulig bit)
    signal = zeros(ceil(length(bits)/2), 1);
    for i = 1:floor(length(bits)/2)
        signal(i)=(bits(2*i-1)*2+1)*(2*bits(2*i)-1);
    end
    %hvis metoden tok imot oddetall bit må siste bit også 4pam kodes
    if mod(length(bits), 2) ~= 0
        signal(length(signal))=3*bits(length(bits));
    end
end