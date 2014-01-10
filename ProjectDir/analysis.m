function analysis(orgsound, decodedsound, channelsound, demodsound, orgindex, decodedindex, modsignal, noisesignal, Fs)
    
    %% bitfeil
    display(sprintf('------------Analyse av system-----------'));
    display(sprintf('# samples av lyd:                  %d', length(orgsound)));
    bitfeil = sum(channelsound ~= demodsound(1:length(channelsound)));
    display(sprintf('# bitfeil (uten feilkorreksjon):   %d', bitfeil));
    display(sprintf('Bitfeilrate (uten feilkorreksjon): %f', bitfeil/length(channelsound)));
    
    %% indexfeil
    %bruker starten til å oversette indexer tilbake
    nytabell = [7 4 3 1 5 8 6 10 14 12 2 0 11 9 15 13];
    
    for i = 1:length(orgindex)
        %orgindex(i) = nytabell(orgindex(i)+1);
        %decodedindex(i) = nytabell(decodedindex(i)+1);
    end
    indexfeil = sum(orgindex ~= decodedindex);
    display(sprintf('# indexfeil (med korreksjon):      %d', indexfeil));
    display(sprintf('Indexfeilrate (med korreksjon):    %f', indexfeil/length(orgindex)));
    display(sprintf('Indexfeilvarians:                  %f', var(orgindex - decodedindex)));
    display(sprintf('Bitfeil per indexfeil:             %f', bitfeil/indexfeil));
    
    %% signaleffekt
    signalstyrke = var(modsignal);
    display(sprintf('Signalstyrke til signalet:         %f', signalstyrke));
    signalfeilvarians = var(modsignal-noisesignal);
    display(sprintf('Støystyrken til signalet:          %f', signalfeilvarians));
    display(sprintf('SNR i dB til signalet:             %f', 10*log10(signalstyrke/signalfeilvarians)));
    
    %% Lydeffekt
    lydstyrke = var(orgsound);
    display(sprintf('Signalstyrke til lyden:            %f', lydstyrke));
    lydfeilvarians = var(orgsound - decodedsound);
    display(sprintf('Støystyrke til lyden:              %f', lydfeilvarians));
    display(sprintf('SNR i dB til lyden:                %f', 10*log10(lydstyrke/lydfeilvarians)));   
    
    %% Feilpredikasjonsanalyse
    feilpred=filter([1, -0.9], 1, orgsound);
    analyse = sort(feilpred);
    display(sprintf('100%%  av feilprediksjonene er <    %f (uten syntese)', analyse(length(analyse))));
    display(sprintf('99,9%% av feilprediksjonene er <    %f', analyse(ceil(0.999*length(analyse)))));
    display(sprintf('99,8%% av feilprediksjonene er <    %f', analyse(ceil(0.998*length(analyse)))));
    display(sprintf('99,5%% av feilprediksjonene er <    %f', analyse(ceil(0.995*length(analyse)))));
    display(sprintf('99,0%% av feilprediksjonene er <    %f', analyse(ceil(0.990*length(analyse)))));
    display(sprintf('96,0%% av feilprediksjonene er <    %f', analyse(ceil(0.960*length(analyse)))));
    display(sprintf('90,0%% av feilprediksjonene er <    %f', analyse(ceil(0.900*length(analyse)))));
    
    %% Lydspekter
    figure(1);
    orgfft = fft(orgsound);
    newfft = fft(decodedsound);
    f = 0:Fs*2*pi/length(orgfft):Fs*pi*(1-1/length(orgfft));
    y = 1.2*max(abs(orgfft));
    subplot(3, 1, 1);
    plot(f, abs(orgfft(1:ceil(length(orgfft)/2))), 'blue'); %[0, pi]
    title('Spekter til orginal lyd');
    axis([0 Fs 0 y])
    subplot(3, 1, 2);
    plot(f, abs(newfft(1:ceil(length(newfft)/2))), 'red');
    title('Spekter til dekomprimert lyd');
    axis([0, Fs, 0, y])
    
    %% Indexhistogram
    subplot(3, 1, 3);
    hist(orgindex, 0:15);
    title('Kvantifiseringsindexer brukt');
    
    %% Antall bitfeil
    figure(2);
    b = zeros(16);
    
    for i = 1:length(orgindex)
        if orgindex(i) ~= decodedindex(i)
            b(orgindex(i)+1,decodedindex(i)+1) = b(orgindex(i)+1,decodedindex(i)+1) + 1;
        end
    end
    for i = 1:16
        subplot(4, 4, i);
        stem(0:15, b(i,:));
        title(num2str(i-1));
    end
end