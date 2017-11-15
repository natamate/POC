clearvars;
close all;
clc;

Bart = imread('bart.bmp');

figure(1);
imshow(Bart);

figure(2);
imhist(Bart);

%% skora index = 200

DolnyProg = 195;
GornyProg = 205;

BartBW = Bart > DolnyProg & Bart < GornyProg;
BartBW = uint8(BartBW) * 255;

figure(3);
imshow(BartBW);