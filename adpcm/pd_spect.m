function [P,F,R,T]=pd_spect(s,Fs,Nfft,Nwin)
%
% function to compute power spectrum and autocorrelation from a 
% speech signal
% Estimate is obtained by averaging periodograms of windows that overlap
% by 50%.
%
% Inputs:
%	s: input signal
%	Fs: sampling frequency
%	Nfft: FFT length.  Should be greater than or equal to Nwin
%	Nwin: window length in samples
%
% Outputs:
%	P: power spectrum estimate
%	F: frequency axis for spectrum plotting
%	R: autocorrelation from spectrum using IFFT
%	T: time scale for autocorrelation plotting

% check Nfft to make sure that it satisfies the constraint that it is at
% least as long as the window sequence
    if Nfft < Nwin
        error('FFT length must be greater or equal to the window length');
    end
    
% compute power density spectrum
    [B,F,T]=sp_gram(s,Nfft,Fs,Nwin,Nwin/2);
    P=mean(abs(B').^2);

%  compute autocorrelation using fft
    PF=P(1:Nfft/2+1);
    PF(Nfft:-1:Nfft/2+2)=P(2:Nfft/2);
    R=ifft(PF,Nfft);
    R=R/R(1);
    T=[0:Nfft-1]*(1/Fs);

end
