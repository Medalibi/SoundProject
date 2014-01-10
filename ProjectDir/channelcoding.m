function channel_sound = channelcoding(dpcm_sound)
channel_sound = zeros(length(dpcm_sound)*7, 1);

bits = [0 0 0 0;
        0 0 0 1;
        0 0 1 0;
        0 0 1 1;
        0 1 0 0;
        0 1 0 1;
        0 1 1 0;
        0 1 1 1;
        1 0 0 0;
        1 0 0 1;
        1 0 1 0;
        1 0 1 1;
        1 1 0 0;
        1 1 0 1;
        1 1 1 0;
        1 1 1 1];

P = [1 1 1;
     0 1 1;
     1 0 1;
     1 1 0]';

G = horzcat(eye(4, 4), P')';
    
for index = 1:length(dpcm_sound)
    % convert index (0-15) to binary vector of lenght 4
    
    m = bits(dpcm_sound(index) + 1, :)';

    sent = mod(G*m, 2);
    channel_sound((7*index - 6):(7*index)) = sent';
end
end