function decoded = ichannelcoding(demod)
decoded = zeros(floor(length(demod)/7), 1);

P = [1 1 1;
     0 1 1;
     1 0 1;
     1 1 0]';

H = horzcat(P, eye(3, 3));

error_correcting = [1 1 1;
                    0 1 1;
                    1 0 1;
                    1 1 0;
                    1 0 0;
                    0 1 0;
                    0 0 1]';

for i = 1:length(decoded)
    recieved = demod((i*7 - 6):(i*7));
    
    syndrome = mod(H*recieved, 2);

    for j = 1:4
        if isequal(error_correcting(:, j), syndrome)
           recieved(j) = mod(recieved(j) + 1, 2);
           break;
        end
    end
    decoded(i) = 8*recieved(1) + ...
                 4*recieved(2) + ...
                 2*recieved(3) + ...
                 1*recieved(4);
end
end