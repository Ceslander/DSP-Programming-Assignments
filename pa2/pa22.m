win = linspace(-20,30,5001);
% index of t is t*100+2001

% set the signal
for i = 1:5001
    win(i) = 0;
end
for i = 2003:3003
    win(i) = 1;
end
win(2003) = 1/2;
win(3003) = 1/2;

ts = 0.04;
fs=1/ts;

samp2 = zeros(1,50/ts+1);
for i = 1:(50/ts+1)
    %disp(i);
    samp2(i) = win((i-1)*4+1);
end

t = linspace(-20,30,1251);
figure(3);
plot(t,samp2);
print(gcf, '-djpeg','-r1000', 'images/samp2_time.jpg');

f=(0:1250)*fs/1251;
samp2_dft = abs(fft(samp2));
figure(4);
plot(f,samp2_dft);
print(gcf, '-djpeg','-r1000', 'images/samp2_freq.jpg');