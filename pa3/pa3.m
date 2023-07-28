
maxit = 7;
time1 = zeros(1,3);
time2 = zeros(1,3);
time3 = zeros(1,maxit);

% profile on

for it = 1:3
        s = rand(1,2^(4*it));
        N=length(s);

        dft1 = zeros(1,N);
        profile clear
        profile -timer 'real' on
        for k = 1:N

            
            for n = 1:N
                dft1(k) = dft1(k) + s(n)*exp((-1)*1i*2*pi*(n-1)*(k-1)/N);
            end
        end
        profile off
        p = profile('info');
        fprintf('%dth loop_fft execution time: %f s\n', it, p.FunctionTable.TotalTime);
        time1(it) = p.FunctionTable.TotalTime;
    
end


for it = 1:3
        s = rand(1,2^(4*it));
        N=length(s);
    
        dft2 = zeros(1,N);
        wmat = zeros(N,N);

        profile clear
        profile -timer 'real' on
        for row = 1:N
            for col = 1:N
                wmat(row,col) = (row-1)*(col-1)*exp(-1i*2*pi/N);
            end
        end
        dft2 = s*wmat;
        profile off
        p = profile('info');
        fprintf('%dth matrix_fft execution time: %f s\n', it, p.FunctionTable.TotalTime);
        time2(it) = p.FunctionTable.TotalTime;
    
end


for it = 1:maxit
        s = rand(1,2^(4*it));
   
        profile clear
        profile -timer 'real' on
        dft3 = fft(s);
        profile off
        p = profile('info');
        fprintf('%dth fft() execution time: %f s\n', it, p.FunctionTable.TotalTime);
        time3(it) = p.FunctionTable.TotalTime;
   
end

time4=[0.229000;0.041000;0.038000;0.039000;0.039000;0.043000;0.079000];


x1 = linspace(1,4,4);
x2 = linspace(1,3,3);
x = linspace(1,7,7);

colors = {'#FA4828', '#77AC30', 'm', '#EDB120'};

clf

hold on;

plot(x2,time1,'Color',colors{1},'Marker','.','MarkerSize',12);
plot(x2,time2,'Color',colors{2},'Marker','.','MarkerSize',12);
plot(x,time3,'Color',colors{3},'Marker','.','MarkerSize',12);
plot(x,time4,'Color',colors{4},'Marker','.','MarkerSize',12);

xlabel('序列长度');
ylabel('运行时间/s');
legend('for循环','矩阵运算','fft(x)','fft(gpuArray(x))');
set(gca,'xticklabel',{'2^4','2^8','2^{12}','2^{16}','2^{20}','2^{24}','2^{28}'});

hold off;

print(gcf, '-djpeg','-r1200', 'picssssss.jpg');



