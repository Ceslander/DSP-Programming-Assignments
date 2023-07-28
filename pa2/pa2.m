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

samp1 = zeros(1,50/ts+1);
for i = 1:(50/ts+1)
    %disp(i);
    samp1(i) = win((i-1)*4+1);
end

% disp(size(samp1));

samp1_dft = abs(fft(samp1));
x = linspace(-20,30,1251);
figure(1);

plot(x,samp1);
% xlim([-20 30]);
print(gcf, '-djpeg','-r1000', 'images/samp1_time.jpg');

f=(0:1250)*fs/1251;
figure(2);
plot(f,samp1_dft);
%saveas(gcf,'images/samp1_freq.jpg');
print(gcf, '-djpeg','-r1000', 'images/samp1_freq.jpg');


% plot(win);
% y=abs(fft(win,2*size(win,2)));
% plot(y);
% disp(size(win));
% wvtool(win);