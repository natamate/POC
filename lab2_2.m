clearvars;
close all; 
clc;

Image = imread('parrot.bmp');
%ImageGray = rgb2gray(Image); 
figure(1);
imshow(Image);

xReScale = 1.5;
yReScale = 1.5;

%%okr rozdzielczosci
[YY, XX] = size(Image);

newYY = floor(YY * yReScale); % floor or round zaokraglenie

newXX = floor(XX * xReScale);

newImage = uint8(zeros(newYY, newXX));

xStep = round(XX/newXX);
yStep = round(YY/newYY);

pomImage = im2double(Image);

for ii=1:(newXX)
    for jj=1:(newYY)
        i1 = floor(ii*xStep);
        j1 = floor(jj*yStep);
        
        i1 = max(i1, 0);
        j1 = max(j1, 0);
        i1 = min(i1, XX-1);
        j1 = min(j1, YY-1);
        %{
        if (i1 > XX - 1)
            i1 = XX-1;
        end
        
         if (j1 > YY - 1)
            j1 = YY-1;
         end
        %}
        
        A = [j1,i1];
        B = A + [1, 0];
        C = A + [0, 1];
        D = A + [1, 1];
             
        i = ii - i1;
      %{ 
        if (i > XX-1)
           i = XX-1;
        end
       %} 
        j = jj - j1;    
        %{
        if ( j > YY-1)
           j = YY -1;
        end
%}            
        vA = pomImage(A(1), A(2));
        vB = pomImage(B(1), B(2));
        vC = pomImage(C(1), C(2));
        vD = pomImage(D(1), D(2));
  
       % newImage(ii, jj) = [1 - i, i] * [vA, vD; vB, vC]*[1-j;j]; 
        newImage(ii, jj) = ((1.0-i)*(1.0-j)*vA + i*(1.0-j)*vB + (1.0-i)*j*vC + i*j*vD);
    end
end

figure(2);
%imshow(bilinearInterpolation(Image, [270 396]));
imshow(newImage);