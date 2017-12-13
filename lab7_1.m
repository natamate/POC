clearvars;
close all;
clc;

load('MR_data');

size = 7;

figure(1);

%% Oryginalne obrazki
subplot(3,5,1);
imshow(I_noisefree, []);
title('noisefree');


subplot(3,5,2);
imshow(I_noisy1, []);
title('noisy1');


subplot(3,5,3);
imshow(I_noisy2, []);
title('noisy2');


subplot(3,5,4);
imshow(I_noisy3, []);
title('noisy3');


subplot(3,5,5);
imshow(I_noisy4, []);
title('noisy4');

%% Splot obrazu

ConFree  = convolution(I_noisefree, [size size]);

subplot(3,5,6);
imshow(ConFree, []);
title('Convolution');

ConNoisy1 = convolution(I_noisy1, [size size]);

subplot(3,5,7);
imshow(ConNoisy1, []);

ConNoisy2 = convolution(I_noisy2, [size size]);

subplot(3,5,8);
imshow(ConNoisy2, []);

ConNoisy3 = convolution(I_noisy3, [size size]);

subplot(3,5,9);
imshow(ConNoisy3, []);

ConNoisy4 = convolution(I_noisy4, [size size]);

subplot(3,5,10);
imshow(ConNoisy4, []);

%% Filtracja bilateralna 

sigmaR = 15;

BilFree  = bilateral(I_noisefree, [size size], sigmaR);

subplot(3,5,11);
imshow(BilFree, []);
title('Bilateral sigmaR = 15');

BilNoisy1  = bilateral(I_noisy1, [size size], sigmaR);

subplot(3,5,12);
imshow(BilNoisy1, []);

BilNoisy2  = bilateral(I_noisy2, [size size], sigmaR);

subplot(3,5,13);
imshow(BilNoisy2, []);

BilNoisy3  = bilateral(I_noisy3, [size size], sigmaR);

subplot(3,5,14);
imshow(BilNoisy3, []);

BilNoisy4  = bilateral(I_noisy4, [size size], sigmaR);

subplot(3,5,15);
imshow(BilNoisy4, []);

%% Zmien sigme

sigmaR = 115;

figure(2);

BilFree  = bilateral(I_noisefree, [size size], sigmaR);

subplot(1,5,1);
imshow(BilFree, []);
title('Bilateral sigmaR = 115');

BilNoisy1  = bilateral(I_noisy1, [size size], sigmaR);

subplot(1,5,2);
imshow(BilNoisy1, []);

BilNoisy2  = bilateral(I_noisy2, [size size], sigmaR);

subplot(1,5,3);
imshow(BilNoisy2, []);

BilNoisy3  = bilateral(I_noisy3, [size size], sigmaR);

subplot(1,5,4);
imshow(BilNoisy3, []);

BilNoisy4  = bilateral(I_noisy4, [size size], sigmaR);

subplot(1,5,5);
imshow(BilNoisy4, []);