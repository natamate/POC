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
%{
Add = imadd(Lena, Jet);

figure(3);
imshow(Add);

Add2 = imadd(uint16(Lena), uint16(Jet));
figure(4);
imshow(Add2, []);
%}

%% Kombinacja liniowa
%{
figure(5);
Comb = imlincomb(2,Lena);
imshow(Comb);
figure(6);
Comb = imlincomb(12,Lena);
imshow(Comb);

figure(7);
Comb = imlincomb(2,Lena,1,Jet);
imshow(Comb);
%}

%% Odejmowanie
%{
figure(8);
Sub = imsubtract(Lena,Jet);
imshow(Sub, []);

figure(9);
Sub2 = imsubtract(int16(Lena), int16(Jet));
imshow(Sub2, []);

figure(10);
Abs = imabsdiff(Lena, Jet);
imshow(Abs,[]);
%}

%% Mnożenie
%{
figure(11);
Multi = immultiply(Lena, Jet);
imshow(Multi, []);

figure(12);
Multi2 = immultiply(Lena, 2);
imshow(Multi2);

MaskaPrev = imread('kolo.bmp');
Maska = boolean(MaskaPrev);

figure(13);
Multi3 = immultiply(Lena, Maska);
imshow(Multi3);
%}

%% Negatyw
Incomp = imcomplement(Lena);
figure(14);
imshow(Incomp);