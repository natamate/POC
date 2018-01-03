clearvars;
close all;
clc;

ImageZeros = zeros(11,11);

ImageZeros(1,10) = 1;

[H theta rho] = hough(ImageZeros,'RhoResolution',0.1,'ThetaResolution',0.5);

figure(1);

subplot(1,3,1);
imshow(H,[]);

%% dodaj kolejny punkt

ImageZeros(5,7) = 1;

[H theta rho] = hough(ImageZeros,'RhoResolution',0.1,'ThetaResolution',0.5);

subplot(1,3,2);
imshow(H,[]);

%% dodaj jeszcze dwa pkt

ImageZeros(4,8) = 1;

ImageZeros(3,11) = 1;

[H theta rho] = hough(ImageZeros,'RhoResolution',0.1,'ThetaResolution',0.5);

subplot(1,3,3);
imshow(H,[]);

X = 180;
Y = 232;

o = theta(X);
p = rho(Y);

x = [0:0.1:10];

y = ((p - x*cosd(o))/sind(o));

figure(2);
subplot(1,2,1);
imshow(ImageZeros,[]);

hold on;
plot(x+1,y+1);


{%% test ab

I = zeros(5,5);
I(3,1) = 1;
I(3,2) = 1;
I(3,3) = 1;
I(3,4) = 1;
I(3,5) = 1;
subplot(1,2,1);
imshow(I);
H = myHough(I,-100,100,1,-100,100,1);
subplot(1,2,2);
imshow(H,[]);

%}
