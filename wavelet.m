s = sin(20.*linspace(0,pi,1000)) + 0.5.*rand(1,1000);
plot(s)

[cA1,cD1] = dwt(s,'db2');
subplot(311), plot(s, 'k'), axis tight;
subplot(312), plot(cA1, 'k'), axis tight;
subplot(313), plot(cD1, 'k'), axis tight;

figure;
[cA2,cD2] = dwt(cA1,'db2');
subplot(311), plot(cA1, 'k'), axis tight;
subplot(312), plot(cA2, 'k'), axis tight;
subplot(313), plot(cD2, 'k'), axis tight;

figure;
[cA3,cD3] = dwt(cA2,'db2');
subplot(311), plot(cA2, 'k'), axis tight;
subplot(312), plot(cA3, 'k'), axis tight;
subplot(313), plot(cD3, 'k'), axis tight;




f = (4,6,10,12,8,6,5,5)

Approximation (trend)
Am = (f(2n) + f(2n+1)) / sqrt(2)

A1 = (5,11,7,5) * sqrt(2)

Detail (fluctuation)

Dm = (f(2n) - f(2n+1)) / sqrt(2)

D1 = (-1,-1,1,0) * sqrt(2)

====
f ==> (a1 | d1)

f = (4,6,10,12,8,6,5,5) ==> (5,11,7,5 | -1,-1,1,0) * sqrt(2)

A1 = (5,11,7,5) * sqrt(2)

A2 = (16, 12)
D2 = (-6, 2)

f ==> (16,12 | -6,2 | -sqrt(2).-sqrt(2),sqrt(2),0)
============================
MATLAB example

file:/usr/local/matlab/help/toolbox/wavelet/ch02_u11.html


===========================
Difference between Digital and Continuous Wavelet Transforms
see: cwt reference page.


========================
De-noising

cd MATLAB
m = wavread('muro2.wav');
mn = wavread('muro2noise.wav');
%md = wden(mn,'rigrsure','s','one',3,'sym8');
md = wden(mn,'heursure','s','one',3,'db3');
subplot(311); plot(m);
subplot(312); plot(mn);
subplot(313); plot(md);
wavwrite(md, 44100, 'muro2dns.wav');

thr = thselect(mn,'rigrsure')
thr = thselect(mn,'sqtwolog')
thr = thselect(mn,'heursure')
thr = thselect(mn,'minimaxi')
======================
Compress

n = 5; w = 'sym2';
% [c,l] = wavedec(m,3,'db3');
[c,l] = wavedec(m,n,w);
thr = 0.001;
keepapp = 0;
[xd,cxd,lxd,perf0,perfl2] = wdencmp('gbl',c,l,w,n,thr,'h',keepapp);
perf0
wavwrite(xd, 44100, 'muro2compress.wav');

figure;
subplot(211); plot(m);
subplot(212); plot(xd);

figure  % compare coefficients
subplot(211); plot(c);
[xc,l] = wavedec(xd,n,w);
subplot(212); plot(xc);

==========================
f = transpose([4 6 10 12 8 6 5 5]);
a = 1 / sqrt(2);
M= [
a a 0 0 0 0 0 0;
0 a a 0 0 0 0 0;
0 0 a a 0 0 0 0;
0 0 0 a a 0 0 0;
0 0 0 0 a a 0 0;
0 0 0 0 0 a a 0;
0 0 0 0 0 0 a a;
0 0 0 0 0 0 0 a];

N = [
a -a 0 0 0 0 0 0;
0 a -a 0 0 0 0 0;
0 0 a -a 0 0 0 0;
0 0 0 a -a 0 0 0;
0 0 0 0 a -a 0 0;
0 0 0 0 0 a -a 0;
0 0 0 0 0 0 a -a;
0 0 0 0 0 0 0 a;];

W  = [
a a 0 0 0 0 0 0;
a -a 0 0 0 0 0 0;
0 0 a a 0 0 0 0;
0 0 a -a 0 0 0 0;
0 0 0 0 a a 0 0;
0 0 0 0 a -a 0 0;
0 0 0 0 0 0 a a;
0 0 0 0 0 0 a -a];

ad = W * f
transpose(W) * ad  % inverse(W) * ad

