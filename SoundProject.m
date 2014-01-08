clear, close all;


[x,Fe,n]= wavread('mozart.wav');
subplot(3,2,1),plot(x);
%sound(x,Fe);
%M=2;
fc=Fe/2;

%wc=2*pi*fc;
[M,wc] = buttord(10/fc,80/fc,3,10); % Filtre pass bas 
[num,dem]=butter(M,wc,'low');
x1=filter(num,dem,x);
subplot(3,2,2),plot(x1);
%sound(x1,Fe);

A=87.56;
xmax=max(x);

F=(1+log(A*abs(x/xmax)))/(1+log(A));
subplot(3,2,3),plot(F);
%sound(F,Fe);


x2=(1+log(A*abs(x/xmax)))/(1+log(A));
subplot(3,2,4),plot(x2);
%sound(x2,Fe);


pow=3;
quant=[];
quant(1)=round(x2(1));
predict=0;
for k=2:length(x2)
    predict=quant(k-1)+predict;
    quant(k)=round(x2(k)-predict);
    if quant(k)>2^(pow-1)-1; quant(k)=2^(pow-1)-1; end;
    if quant(k)<-2^(pow-1); quant(k)=-2^(pow-1); end;
end
subplot(3,2,5),plot(quant);
undif=zeros(size(quant));
undif(1)=quant(1);
for k=2:length(quant)
    undif(k)=undif(k-1)+quant(k);
end
subplot(3,2,6),plot(undif);
sound(undif,Fe);

% %CAN
% Mc=length(x2);
% xmin=min(x);
% q=(xmax-xmin)/(2^n);
% for i=1:Mc
%     if x2(i)<=xmin
%         x3(i)=0;
%     elseif x2(i)>=xmax
%         x3(i)=(2^n)-1;
%     else
%         x3(i)=(x2(i)-xmin)/q;
%     end;
% end;
% subplot(3,2,5),plot(x3);
% 
% % Codeur
% 
% undif=zeros(size(x3));
% undif(1)=x3(1);
% for k=2:length(x3)
%     undif(k)=undif(k-1)+x3(k);
% end
% 
% %for j=1:Mc
% %    xpcm(j)=dec2bin(x3(j));
% %end;
% subplot(3,2,6),plot(undif);
% 


