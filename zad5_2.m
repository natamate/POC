clearvars;
close all;
clc;

W = 15;
W2 = round(W/2);

Rice = imread('rice.png');
%Rice = imread('katalog.bmp');
RiceBW = Rice;

[X Y] = size(Rice);

figure(1);
imshow(Rice);

for i = 1:X
    for j = 1:Y
        if Rice(i,j) >= meanLT(i, j, W2, Rice, X, Y)
            RiceBW(i,j) = 255;
        else
            RiceBW(i,j) = 0;
        end
    end
end

figure(2); 
imshow(RiceBW);


RiceBW = Rice;
R = 128;
k = 0.15;
for i = 1:X
    for j = 1:Y
        mean = meanLT(i, j, W2, Rice, X, Y);
        stddev = stddevLT(i, j, W2, Rice, mean, X, Y);
        T = mean*(1 - k*(stddev/R - 1));
        if Rice(i,j) >= T
            RiceBW(i,j) = 255;
        else
            RiceBW(i,j) = 0;
        end
    end
end
figure(3);
imshow(RiceBW);
