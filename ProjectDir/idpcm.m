function sound = idpcm(index)
    a = 0.9;
    
    %nytabell = [2 11 14 8 10 6 1 7 0 9 13 3 15 5 4 12];
    %nytabell = [7 10 6 0 4 8 1 11 2 5 3 13 9 15 14 12];
    %nytabell = [7 1 6 0 2 8 3 15 12 13 5 14 9 11 4 10];
    %nytabell = [7 10 5 6 4 8 1 12 0 11 3 9 14 15 2 13];
    
    %nytabell = [11 3 10 2 1 4 6 0 5 13 7 12 9 15 8 14];
    %nytabell = [7 4 3 1 5 8 6 10 14 12 2 0 11 9 15 13];
    
    dq = 0.04/8; %må endres med quantizer
    sound = zeros(size(index));
    
    %index(1) = nytabell(index(1)+1); %test
    
    sound(1) = (index(1) - 7.5)*dq;
    for i=2:length(index)
        %index(i) = nytabell(index(i)+1); %test
        
        e = (index(i) - 7.5)*dq;
        sound(i) = e + a*sound(i-1);
    end
end