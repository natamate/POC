clearvars;
close all; 
clc;

Lena = imread('lena.bmp');
Jet = imread('jet.bmp');
%{
figure(1);
imshow(Lena);

figure(2);
imshow(Jet);
%}

%% Dodawanie

Add = imadd(Lena, Jet);

figure(1);
subplot(1,2,1);
imshow(Add);

Add2 = imadd(uint16(Lena), uint16(Jet));
subplot(1,2,2);
imshow(Add2, []);


%% Kombinacja liniowa

figure(2);
subplot(1,2,1);
Comb = imlincomb(2,uint16(Lena), 3, uint16(Jet));
imshow(Comb,[]);

subplot(1,2,2);
Comb = imlincomb(2,uint16(Lena),1,uint16(Jet));
imshow(Comb,[]);


%% Odejmowanie

figure(3);
subplot(1,3,1);
Sub = imsubtract(Lena,Jet);
imshow(Sub, []);

subplot(1,3,2);
Sub2 = imsubtract(int16(Lena), int16(Jet));
imshow(Sub2, []);

subplot(1,3,3);
Abs = imabsdiff(Lena, Jet);
imshow(Abs,[]);

%% Mnożenie

figure(4);
subplot(1,3,1);
Multi = immultiply(uint16(Lena), uint16(Jet));
imshow(Multi, []);

subplot(1,3,2);
Multi2 = immultiply(Lena, 2);
imshow(Multi2);

MaskaPrev = imread('kolo.bmp');
Maska = boolean(MaskaPrev);

subplot(1,3,3);
Multi3 = immultiply(uint16(Lena), uint16(Maska));
imshow(Multi3, []);


%% Negatyw
Incomp = imcomplement(uint16(Lena));
figure(5);
imshow(Incomp,[]);