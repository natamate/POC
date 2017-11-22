clearvars;
close all;
clc;

%% filtry liniowe (dolnoprzepustowe)

%size = 3
Plansza = imread('plansza.tif');

PlanszaDouble = double(Plansza);

h = fspecial('average', 3);

hDouble = double(h);

PlanszaFiltr = uint8(conv2(PlanszaDouble,hDouble,'same'));

PlanszaDiffFiltr = imabsdiff(Plansza,PlanszaFiltr);

figure(1);
subplot(5,3,1);
imshow(Plansza);

subplot(5,3,2);
imshow(PlanszaFiltr);

subplot(5,3,3);
imshow(PlanszaDiffFiltr, []);

%size = 5

h = fspecial('average', 5);

hDouble = double(h);

PlanszaFiltr = uint8(conv2(PlanszaDouble,hDouble,'same'));

PlanszaDiffFiltr = imabsdiff(Plansza,PlanszaFiltr);

subplot(5,3,4);
imshow(Plansza);

subplot(5,3,5);
imshow(PlanszaFiltr);

subplot(5,3,6);
imshow(PlanszaDiffFiltr, []);

%size = 9
h = fspecial('average', 9);

hDouble = double(h);

PlanszaFiltr = uint8(conv2(PlanszaDouble,hDouble,'same'));

PlanszaDiffFiltr = imabsdiff(Plansza,PlanszaFiltr);

subplot(5,3,7);
imshow(Plansza);

subplot(5,3,8);
imshow(PlanszaFiltr);

subplot(5,3,9);
imshow(PlanszaDiffFiltr, []);

%size = 15
h = fspecial('average', 15);

hDouble = double(h);

PlanszaFiltr = uint8(conv2(PlanszaDouble,hDouble,'same'));

PlanszaDiffFiltr = imabsdiff(Plansza,PlanszaFiltr);

subplot(5,3,10);
imshow(Plansza);

subplot(5,3,11);
imshow(PlanszaFiltr);

subplot(5,3,12);
imshow(PlanszaDiffFiltr, []);

%size = 35

h = fspecial('average', 35);

hDouble = double(h);

PlanszaFiltr = uint8(conv2(PlanszaDouble,hDouble,'same'));

PlanszaDiffFiltr = imabsdiff(Plansza,PlanszaFiltr);

subplot(5,3,13);
imshow(Plansza);

subplot(5,3,14);
imshow(PlanszaFiltr);

subplot(5,3,15);
imshow(PlanszaDiffFiltr, []);


%% filtry liniowe (dolnoprzepustowe) dla obrazu rzeczywistego

Plansza = imread('lena.bmp');

PlanszaDouble = double(Plansza);

h = fspecial('average', 3);

hDouble = double(h);

PlanszaFiltr = uint8(conv2(PlanszaDouble,hDouble,'same'));

PlanszaDiffFiltr = imabsdiff(Plansza,PlanszaFiltr);

figure(2);
subplot(5,3,1);
imshow(Plansza);

subplot(5,3,2);
imshow(PlanszaFiltr);

subplot(5,3,3);
imshow(PlanszaDiffFiltr, []);

%size = 5

h = fspecial('average', 5);

hDouble = double(h);

PlanszaFiltr = uint8(conv2(PlanszaDouble,hDouble,'same'));

PlanszaDiffFiltr = imabsdiff(Plansza,PlanszaFiltr);

subplot(5,3,4);
imshow(Plansza);

subplot(5,3,5);
imshow(PlanszaFiltr);

subplot(5,3,6);
imshow(PlanszaDiffFiltr, []);

%size = 9
h = fspecial('average', 9);

hDouble = double(h);

PlanszaFiltr = uint8(conv2(PlanszaDouble,hDouble,'same'));

PlanszaDiffFiltr = imabsdiff(Plansza,PlanszaFiltr);

subplot(5,3,7);
imshow(Plansza);

subplot(5,3,8);
imshow(PlanszaFiltr);

subplot(5,3,9);
imshow(PlanszaDiffFiltr, []);

%size = 15
h = fspecial('average', 15);

hDouble = double(h);

PlanszaFiltr = uint8(conv2(PlanszaDouble,hDouble,'same'));

PlanszaDiffFiltr = imabsdiff(Plansza,PlanszaFiltr);

subplot(5,3,10);
imshow(Plansza);

subplot(5,3,11);
imshow(PlanszaFiltr);

subplot(5,3,12);
imshow(PlanszaDiffFiltr, []);

%size = 35

h = fspecial('average', 35);

hDouble = double(h);

PlanszaFiltr = uint8(conv2(PlanszaDouble,hDouble,'same'));

PlanszaDiffFiltr = imabsdiff(Plansza,PlanszaFiltr);

subplot(5,3,13);
imshow(Plansza);

subplot(5,3,14);
imshow(PlanszaFiltr);

subplot(5,3,15);
imshow(PlanszaDiffFiltr, []);

%% dobór maski

M = [1 2 1; 2 4 2; 1 2 1];
M = M/sum(sum(M));

Lena = imread('lena.bmp');

h = fspecial('average',3);

LenaFiltr = uint8(conv2(double(Lena),double(h),'same'));

LenaFiltrMaska = uint8(conv2(double(LenaFiltr),M,'same'));

LenaMaska = uint8(conv2(double(Lena),double(h),'same'));

figure(3);

subplot(1,3,1);
imshow(Lena);

subplot(1,3,2);
imshow(LenaFiltr);

subplot(1,3,3);
imshow(LenaFiltrMaska);


%% maska Gaussa

Size = [5 5];

sigma = 0.5;

sigma2 = 2;

sigma3 = 5;

h = fspecial('gaussian',Size,sigma);

figure(4);
subplot(1,3,1);
mesh(h);

h2 = fspecial('gaussian',Size,sigma2);
subplot(1,3,2);
mesh(h2);

h3 = fspecial('gaussian',Size,sigma3);
subplot(1,3,3);
mesh(h3);

LenaGauss = uint8(conv2(double(LenaFiltr),double(h),'same'));

figure(5);
subplot(1,3,1);
imshow(LenaGauss);

LenaGauss = uint8(conv2(double(LenaFiltr),double(h2),'same'));

subplot(1,3,2);
imshow(LenaGauss);

LenaGauss = uint8(conv2(double(LenaFiltr),double(h3),'same'));

subplot(1,3,3);
imshow(LenaGauss);
