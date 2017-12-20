clearvars;
close all;
clc;

Image = imread('umbrealla.png');

figure(1);
imshow(Image);

%% konwersja na HSV
ImageHSV = rgb2hsv(Image);
ImageHSV = double(ImageHSV);

H = ImageHSV(:,:,1);

[Y X] = size(H);

global minpodzial;
minpodzial = 8;
global progodchylenie;
progodchylenie = 0.05;
global segRes;
segRes = zeros(Y,X);
global index;
index = 1;
global Mres;
Mres = zeros(Y,X);

Split(H,1,Y,1,X);
figure(2);
imshow(segRes,[]);

%%
i=0;
while i < index
   IB = segRes == i;
   [Yib Xib] = size(IB);
   if sum(IB(:)) == 0
       i = i + 1;
       continue;
   end
   [yF xF] = find(IB,1,'first');
   IBdil = imdilate(IB,strel('square',3));
   IBdiff = imabsdiff(IBdil,IB);
   IBmult = IBdiff.* segRes;
   IBmult_non_zeros = nonzeros(IBmult);
   IBunique = unique(IBmult_non_zeros);
   joined = 0;
   for k = 1:numel(IBunique)
        IBS = segRes == IBunique(k);
        [yFS, xFS] = find(IBS,1,'first');        
        color_difference = abs(Mres(yF,xF) - Mres(yFS, xFS));
        if color_difference < (5/255)
            segRes(IBS) = i;
            joined = 1;
        end
   end
   if joined == 0
       i = i+1;
   end
end

segRes_for = segRes;
MRes_for = Mres;

segRes_unique = unique(segRes);
for i = 1:numel(segRes_unique)
    obszar = segRes == segRes_unique(i);
    if sum(obszar) < 33
        segRes(obszar) = 0;
    end
end

segRes_unique_2 = unique(segRes);
for i = 1:numel(segRes_unique_2)
    obszar = segRes == segRes_unique_2(i);
    segRes(obszar) = i;
end

ResultImage = label2rgb(segRes);

figure(3);

subplot(1,2,1);
imshow(Image);

subplot(1,2,2);
imshow(ResultImage,[]);
