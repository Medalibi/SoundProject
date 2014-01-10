function [dhat,csign,codeword,delta]=quant1(d,deltas,nbits,P,deltamin,deltamax)
%
% routine for step size adaptation using the Jayant step size adaptation 
% procedure and for quantization of the signal, d, for ADPCM speech coding 
%
% OUTPUT Parameters:
%   dhat=quantized version of d
%   csign=codeword sign (+1 if positive, -1 if negative)
%   codeword=range of 0 to 2^(nbits-1)-1
%   delta=updated delta
%
% INPUT Parameters:
%   d=input signal to be quantized
%   deltas=current value of delta for uniform quantizer
%   nbits=number of bits in quantizer
%   P=array of weights for quantizer adaptation to signal
%   deltamin=minimum step size of quantizer
%   deltamax=maximum step size of quantizer

% set sign of codewords depending on sign of differential input, d
    if (d >= 0) csign=1;
    else csign = -1;
    end
    
% quantize d using uniform quantizer with B=nbits number of bits for each
% codeword
    codeword=floor(abs(d)/deltas);
    if (codeword >= 2^(nbits-1)) codeword=2^(nbits-1)-1;
    end
    
% adapt quantizer step size
    dhat=deltas*(codeword+1/2);
    if (csign == -1) dhat=-dhat;
    end
    
% constrain step size to with range of deltamin <= delta <= deltamax
    delta=deltas*P(codeword+1);
    if (delta < deltamin) delta=deltamin;
    elseif (delta > deltamax) delta=deltamax;
    end
end