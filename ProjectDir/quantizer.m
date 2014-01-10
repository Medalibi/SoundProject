function [index, y] = quantizer(x) %gir desisjonsindex gitt verdi x
    qmax = 0.04; %må endres i idpcm
    dq = qmax/8; %2*qmax/16
    index = floor((x+qmax)/dq);
    if index < 0
        index = 0;
    elseif index > 15
        index = 15;
    end
    y = (index - 7.5)*dq;
end
%qmax ca 0.14 ved 2-pam, 0.04 ved 4-pam