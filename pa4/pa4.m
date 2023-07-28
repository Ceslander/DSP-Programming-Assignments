[x,fs] = audioread("musique.ogg");
% fs = 44100Hz

time_length = length(x)/fs;
t = (0:length(x)-1)/fs;

figure(1);
plot(t, x);
xlabel('Time (s)');
ylabel('Amplitude');
title('Original Signal in Time Domain');
print(gcf, '-djpeg','-r1200', 'original_time.jpg');
 
figure(2);
stft(x(:,1) , fs , 'FFTLength' , 1024); 
colormap jet
title('Original Signal in Spectrogram');
print(gcf, '-djpeg','-r1200', 'original_stft.jpg');

% 5kHz
f1 = 5e3;
[p1,q1] = rat(f1/fs);
x1 = resample(x,p1,q1);

% 10kHz
f2 = 10e3;
[p2,q2] = rat(f2/fs);
x2 = resample(x,p2,q2);

% 15kHz
f3 = 15e3;
[p3,q3] = rat(f3/fs);
x3 = resample(x,p3,q3);

audiowrite("sampled/sampled1.ogg",x1,f1);
audiowrite("sampled/sampled2.ogg",x2,f2);
audiowrite("sampled/sampled3.ogg",x3,f3);

t1 = (0:length(x1)-1)/f1;
figure(3)
plot(t1, x1);
xlabel('Time (s)');
ylabel('Amplitude');
title('Downsampled Signal at 5kHz in Time Domain');
print(gcf, '-djpeg','-r1200', 'sampled/sampled1_time.jpg');
figure(4);
stft(x1(:,1) , f1 , 'FFTLength' , 1024); 
colormap jet
title('Downsampled Signal at 5kHz in Spectrogram');
print(gcf, '-djpeg','-r1200', 'sampled/sampled1_stft.jpg');

t2 = (0:length(x2)-1)/f2;
figure(5);
plot(t2, x2);
xlabel('Time (s)');
ylabel('Amplitude');
title('Downsampled Signal at 10kHz in Time Domain');
print(gcf, '-djpeg','-r1200', 'sampled/sampled2_time.jpg');
figure(6);
stft(x2(:,1) , f2 , 'FFTLength' , 1024); 
colormap jet
title('Downsampled Signal at 10kHz in Spectrogram');
print(gcf, '-djpeg','-r1200', 'sampled/sampled2_stft.jpg');

t3 = (0:length(x3)-1)/f3;
figure(7);
plot(t3, x3);
xlabel('Time (s)');
ylabel('Amplitude');
title('Downsampled Signal at 15kHz in Time Domain');
print(gcf, '-djpeg','-r1200', 'sampled/sampled3_time.jpg');
figure(8);
stft(x3(:,1) , f3 , 'FFTLength' , 1024); 
colormap jet
title('Downsampled Signal at 15kHz in Spectrogram');
print(gcf, '-djpeg','-r1200', 'sampled/sampled3_stft.jpg');


method = 'spline';
points = 1:length(x);
points1=(0:length(x1)-1)*(length(x)-1)/(length(x1)-1)+1;
points2=(0:length(x2)-1)*(length(x)-1)/(length(x2)-1)+1;
points3=(0:length(x3)-1)*(length(x)-1)/(length(x3)-1)+1;

restored1 = interp1(points1,x1,points,method);
restored2 = interp1(points2,x2,points,method);
restored3 = interp1(points3,x3,points,method);

figure(9);
plot(t, restored1);
xlabel('Time (s)');
ylabel('Amplitude');
title('Original Signal in Time Domain');
print(gcf, '-djpeg','-r1200', 'restored/restored1_time.jpg');
figure(10);
stft(restored1(:,1) , fs , 'FFTLength' , 1024); 
colormap jet
title('Original Signal in Spectrogram');
print(gcf, '-djpeg','-r1200', 'restored/restored1_stft.jpg');

figure(11);
plot(t, restored2);
xlabel('Time (s)');
ylabel('Amplitude');
title('Original Signal in Time Domain');
print(gcf, '-djpeg','-r1200', 'restored/restored2_time.jpg');
figure(12);
stft(restored2(:,1) , fs , 'FFTLength' , 1024); 
colormap jet
title('Original Signal in Spectrogram');
print(gcf, '-djpeg','-r1200', 'restored/restored2_stft.jpg');

figure(13);
plot(t, restored3);
xlabel('Time (s)');
ylabel('Amplitude');
title('Original Signal in Time Domain');
print(gcf, '-djpeg','-r1200', 'restored/restored3_time.jpg');
figure(14);
stft(restored3(:,1) , fs , 'FFTLength' , 1024); 
colormap jet
title('Original Signal in Spectrogram');
print(gcf, '-djpeg','-r1200', 'restored/restored3_stft.jpg');


audiowrite("restored/restored1.ogg",restored1,fs);
audiowrite("restored/restored2.ogg",restored2,fs);
audiowrite("restored/restored3.ogg",restored3,fs);


