
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

% filter
Wp = 5/(fs/2);
Ws = 12/(fs/2);
Rp = 15;
Rs = 90;
[n,Wn] = buttord(Wp,Ws,Rp,Rs);
[b,a] = butter(n,Wn);
y = filtfilt(b,a,win);


win = y;


samp3 = zeros(1,50/ts+1);
for i = 1:(50/ts+1)
    %disp(i);
    samp3(i) = win((i-1)*4+1);
end


t = linspace(-20,30,1251);
figure(5);
plot(t,samp3);
print(gcf, '-djpeg','-r1000', 'images/samp3_time.jpg');

f=(0:1250)*fs/1251;
samp3_dft = abs(fft(samp3));
figure(6);
plot(f,samp3_dft);
print(gcf, '-djpeg','-r1000', 'images/samp3_freq.jpg');