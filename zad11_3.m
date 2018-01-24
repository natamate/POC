clearvars;
close all;
clc;

Image = imread('shapes.png');

figure(1);
imshow(Image,[]);

Image4 = bwlabel(Image,4);

figure(2);
imshow(Image4);

%% wyznacz wsp ksztaltu za pomoca dostarczonej funkcji
detectedShapes = obliczWspolczynniki(Image4);

[YY, XX] = size(Image4);

for y = 1:YY
   for x = 1:XX
       piksel = Image4(y,x);
       %% wyzeruj piksel lub nie
       if (piksel ~= 0 && ~(detectedShapes(piksel,2) > 0.33 && detectedShapes(piksel,2) < 0.66))
            Image4(y,x) = 0;
       end
   end
end

figure(3);
imshow(Image4);


ImageReal = imread('shapesReal.png');
%% obraz do postaci binarnej usuniecie zaklocen
ImageReal = imerode(imcomplement(im2bw(ImageReal,0.22)),strel('rectangle',[5 5]));

figure(4);
imshow(ImageReal);

ImageRealIndex = bwlabel(ImageReal,4);

figure(5);
imshow(ImageRealIndex,[]);

detectedShapesReal = obliczWspolczynniki(ImageRealIndex);

[YY, XX] = size(ImageRealIndex);

for y = 1:YY
   for x = 1:XX
       piksel = ImageRealIndex(y,x);
       if (piksel ~= 0 && ~(detectedShapesReal(piksel,1) > 0.50 && detectedShapesReal(piksel,5) < 0.010 && detectedShapesReal(piksel,2) < 0.9))
            ImageRealIndex(y,x) = 0;
       end
   end
end

figure(6);
imshow(ImageRealIndex);