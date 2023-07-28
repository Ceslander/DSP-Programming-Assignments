
win = linspace(-20,30,5001);
% index of t is t*100+2001

% set the signal
for i = 1:5001
    win(i) = 0;
end
for i = 2001:3001
    win(i) = 1;
end
win(2001) = 1/2;
win(3001) = 1/2;

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

samp4 = zeros(1,50/ts+1);
for i = 1:(50/ts+1)
    %disp(i);
    samp4(i) = win((i-1)*4+1);
end

% disp(size(samp1));

samp4_dft = abs(fft(samp4));
x = linspace(-20,30,1251);
figure(7);

plot(x,samp4);
% xlim([-20 30]);
print(gcf, '-djpeg','-r1000', 'images/samp4_time.jpg');

f=(0:1250)*fs/1251;
figure(8);
plot(f,samp4_dft);
%saveas(gcf,'images/samp1_freq.jpg');
print(gcf, '-djpeg','-r1000', 'images/samp4_freq.jpg');


% plot(win);
% y=abs(fft(win,2*size(win,2)));
% plot(y);
% disp(size(win));
% wvtool(win);