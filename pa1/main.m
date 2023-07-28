im = imread('baboon.bmp');

psf = zeros(5,5);
psf(:) = 0.04;

% blurred
im1 = conv2(im,psf);
amax=max(max(im1));
amin=min(min(im1));
im1=(im1-amin)/(amax-amin);
imwrite(im1,'blurred.bmp');

% noise
im21=awgn(im1,30);
im22=awgn(im1,20);
im23=awgn(im1,10);
imwrite(im21,'snr30dB.bmp');
imwrite(im22,'snr20dB.bmp');
imwrite(im23,'snr10dB.bmp');

im31=deconvwnr(im21,psf);
im32=deconvwnr(im22,psf);
im33=deconvwnr(im23,psf);
imwrite(im31,"direct_30dB.bmp");
imwrite(im32,"direct_20dB.bmp");
imwrite(im33,"direct_10dB.bmp");

im31_10=deconvlucy(im21,psf);
im32_10=deconvlucy(im22,psf);
im33_10=deconvlucy(im23,psf);
imwrite(im31_10,'lucy_default_1.bmp');
imwrite(im32_10,'lucy_default_2.bmp');
imwrite(im33_10,'lucy_default_3.bmp');

im31_1=deconvlucy(im21,psf,1);
im32_1=deconvlucy(im22,psf,1);
im33_1=deconvlucy(im23,psf,1);
imwrite(im31_1,'lucy_1_1.bmp');
imwrite(im32_1,'lucy_1_2.bmp');
imwrite(im33_1,'lucy_1_3.bmp');

im31_5=deconvlucy(im21,psf,5);
im32_5=deconvlucy(im22,psf,5);
im33_5=deconvlucy(im23,psf,5);
imwrite(im31_5,'lucy_5_1.bmp');
imwrite(im32_5,'lucy_5_2.bmp');
imwrite(im33_5,'lucy_5_3.bmp');

im31_20=deconvlucy(im21,psf,20);
im32_20=deconvlucy(im22,psf,20);
im33_20=deconvlucy(im23,psf,20);
imwrite(im31_20,'lucy_20_1.bmp');
imwrite(im32_20,'lucy_20_2.bmp');
imwrite(im33_20,'lucy_20_3.bmp');

im41=deconvwnr(im21,psf,1/30);
im42=deconvwnr(im22,psf,1/20);
im43=deconvwnr(im23,psf,1/10);
imwrite(im41,'wiener_30dB.bmp');
imwrite(im42,'wiener_20dB.bmp');
imwrite(im43,'wiener_10dB.bmp');

tmp1=deconvwnr(im21,psf,1/40);
imwrite(tmp1,'tmp1.bmp');
tmp2=deconvwnr(im21,psf,1/50);
imwrite(tmp2,'tmp2.bmp');
tmp3=deconvwnr(im21,psf,1/20);
imwrite(tmp3,'tmp3.bmp');
tmp4=deconvwnr(im21,psf,1/10);
imwrite(tmp4,'tmp4.bmp');
tmp5=deconvwnr(im21,psf,1);
imwrite(tmp5,'tmp5.bmp');
tmp6=deconvwnr(im21,psf,10);
imwrite(tmp6,'tmp6.bmp');