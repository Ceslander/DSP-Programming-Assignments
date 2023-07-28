[x,fs] = audioread("musique.ogg");

cent = [30 60 150 400 1000 2500 6000 15000];    % center frequencies
bandwidth = [25 30 60 200 400 1100 2500 6500];  % half bandwidths
adjust = [3 6 5 3 1 -1 -4 -5];

y = zeros(length(x),2);
for channel = 1:2
    h = zeros(length(cent), length(x));
    for i = 1:length(cent)
        [b, a] = butter(2, [cent(i)-bandwidth(i) cent(i)+bandwidth(i)]/(fs/2));
        h(i,:) = filter(b, a, x(:,channel));
    end
    
    for i = 1:length(cent)
        h(i,:) = h(i,:) * 10^(adjust(i)/20);
    end
    y(:,channel) = sum(h,1);
    y(:,channel) = y(:,channel)/max(abs(y(:,channel)));
end

audiowrite("equalized.ogg",y,fs);


