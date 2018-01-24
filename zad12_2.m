clearvars;
close all;
clc;

Image = imread('kwadrat.bmp');

Imagef = fft2(Image);
Imageshift = fftshift(Imagef);

A = abs(Imageshift);
F = angle(Imageshift.*(A>0.0001));
A = log10(A+1);

figure(1);

subplot(6,4,1);
imshow(Image);

title('bez operacji');

subplot(6,4,2); 
imshow(Imageshift);

subplot(6,4,3); 
imshow(A,[]);

subplot(6,4,4);
imshow(F,[]);

Image = imread('kwadratT.bmp');

Imagef = fft2(Image);
Imageshift = fftshift(Imagef);

A = abs(Imageshift);
F = angle(Imageshift.*(A>0.0001));
A = log10(A+1);

%% wplyw translacji


subplot(6,4,5); 
imshow(Image);
title('translacja');

subplot(6,4,6); 
imshow(Imageshift);

subplot(6,4,7); 
imshow(A,[]);

subplot(6,4,8); 
imshow(F,[]);

%%
Image = imread('kwadrat.bmp');

Imagef = fft2(Image);
Imageshift = fftshift(Imagef);

A = abs(Imageshift);
F = angle(Imageshift.*(A>0.0001));
A = log10(A+1);

subplot(6,4,9); 
imshow(Image);

subplot(6,4,10); 
imshow(Imageshift);

subplot(6,4,11); 
imshow(A,[]);

subplot(6,4,12);
imshow(F,[]);


I = imread('kwadrat45.bmp');

If = fft2(I);
Ishift = fftshift(If);

A = abs(Ishift);
F = angle(Ishift.*(A>0.0001));
A = log10(A+1);

subplot(6,4,13);
imshow(I);
title('wplyw rotacji');

subplot(6,4,14);
imshow(Ishift);

subplot(6,4,15);
imshow(A,[]);

subplot(6,4,16); 
imshow(F,[]);

I = imread('kwadratS.bmp');

If = fft2(I);
Ishift = fftshift(If);

A = abs(Ishift);
F = angle(Ishift.*(A>0.0001));
A = log10(A+1);

subplot(6,4,17); imshow(I);
title('wplyw zmiany rozmiaru');

subplot(6,4,18); imshow(Ishift);
subplot(6,4,19); imshow(A,[]);
subplot(6,4,20); imshow(F,[]);


I = imread('kwadratKL.bmp');

If = fft2(I);
Ishift = fftshift(If);

A = abs(Ishift);
F = angle(Ishift.*(A>0.0001));
A = log10(A+1);

subplot(6,4,21); imshow(I);
title('wplyw kombinacji liniowej');

subplot(6,4,22); imshow(Ishift);
subplot(6,4,23); imshow(A,[]);
subplot(6,4,24); imshow(F,[]);
