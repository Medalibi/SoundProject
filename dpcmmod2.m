% fs=8000;
% t=0:1/fs:.3;
% x=sin(2*pi*400*t);
% y=resample(x,4,1);
% plot(t,x);
% %plot(y);
% 
pcmfile='C:\documents and settings\goldfita\Desktop\s';
fid=fopen(pcmfile,'rb');
pcmsig=fread(fid,inf,'int16',0,'n');
fclose(fid);
%%
up=12;
upper=24000;
fs=8000;
sig=pcmsig(1:upper);
fc=0:(fs/2):((up-1)*(fs/2));
t=0:1/(fs*up):((upper-1)/(fs*up));
s=resample(sig',up,1);
stot=s(1:upper);
samp=1;
L=511;
delayfilter=zeros(L,1);
delayfilter((L+1)/2)=1;
h=remez(L-1,[.01 .99],[1 1],'Hilbert');
for k=fc
    ssamp=s(samp:(samp+upper-1));
    ssamp2=filter(delayfilter,1,ssamp);
    mh=filter(h,1,ssamp);
    %mh=imag(hilbert(ssamp));     %Hilbert Transform of baseband
    sb=ssamp2.*cos(2*pi*k*t)-mh.*sin(2*pi*k*t); 
    stot=stot+sb;
    %figure(k+1);psd(sb);
    samp=samp+upper;
end
%%
pow=2;
sig=stot;
mi=min(sig);
ma=max(sig+abs(mi));
sig1=(sig+abs(mi))/ma;
sig2=(sig1*(2^pow-1)-2^(pow-1))*25;
quant=[];
quant(1)=round(sig2(1));
predict=0;
for k=2:length(sig2)
    predict=quant(k-1)+predict;
    quant(k)=round(sig2(k)-predict);
    if quant(k)>2^(pow-1)-1; quant(k)=2^(pow-1)-1; end;
    if quant(k)<-2^(pow-1); quant(k)=-2^(pow-1); end;
end

undif=zeros(size(quant));
undif(1)=quant(1);
for k=2:length(quant)
    undif(k)=undif(k-1)+quant(k);
end

%%
stot=undif;
sout=[];
f=0;
[b2,a2]=ellip(8,5,70,1/12,'low');
[b3,a3]=ellip(10,5,70,.04,'high');
stot=filter(b3,a3,stot);
for k=fc
    f=f+1;
    if f==1
        [b,a]=ellip(8,5,70,1/12,'low');
    elseif f==12
        [b,a]=ellip(8,5,70,11/12,'high');
    elseif and(f~=2,f~=11)
        [b,a]=ellip(8,5,70,[(f-1)/12 f/12],'bandpass');
    else
        [b,a]=ellip(8,5,70,[(f-1)/12-.01 f/12+.01],'bandpass');
    end
    out=filter(b,a,stot);
    %figure(k+1);freqz(b,a);
    out=out.*cos(2*pi*k*t);
    out=filter(b2,a2,out);
    %figure(k+1);psd(out);
    out=resample(out,1,up);
    %figure(k+1);psd(out);
    sout=[sout;out(:)];
end
