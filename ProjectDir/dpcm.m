function index = dpcm(sound)
    a=0.9;
    %nytabell = [8 6 0 11 14 13 5 7 3 9 4 1 15 10 2 12];
    %nytabell = [3 6 8 10 4 9 2 0 5 12 1 7 15 11 14 13];
    %nytabell = [3 1 4 6 14 10 2 0 5 12 15 13 8 9 11 7];
    %nytabell = [8 6 14 10 4 2 3 0 5 11 1 9 7 15 12 13];
    
    %nytabell = [7 4 3 1 5 8 6 10 14 12 2 0 11 9 15 13];
    %nytabell = [11 3 10 2 1 4 6 0 5 13 7 12 9 15 8 14];
    
    index = zeros(size(sound));
    xr=0;
    for i=1:length(sound)
        [index(i),e] = quantizer(sound(i)-a*xr);
        xr=e+a*xr;
        
        %index(i) = nytabell(index(i)+1); % test
    end
end