%if ~exist('sig')
    pcmfile='mozart.wav';
    fid=fopen(pcmfile,'rb');
    pcmsig=fread(fid,inf,'int16',0,'n');
    fclose(fid);
    lastsamp=24000;
    [b,a]=butter(12,.05,'low');
    sig=filter(b,a,pcmsig(1:lastsamp));
    fs=8000;
    t=0/fs:1/fs:((lastsamp-1)/fs);
%end



pow=2;
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
plot(undif);

%plot(abs(sig2-undif')/max(abs(sig2)))