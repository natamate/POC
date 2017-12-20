%Krzysztof Świder
close all;
clearvars;
clc;

%% wczytanie obrazu

I = imread('knee.png');
imshow(I);
%[x y] = ginput(1);
x = 262;
y = 264;
I = double(I);

[X Y] = size(I);

visited = zeros(X,Y);
segmented = zeros(X,Y);

stack = zeros(10000,2);
iStack = 1;

stack(iStack,:) = [x y];
visited(x,y) = 1;
segmented(x,y) = 1;

%% 

while (iStack > 0)
    sx = stack(iStack,1);
    sy = stack(iStack,2);
    iStack = iStack - 1;
    
    if (sx - 1 > 0) && (sx + 1 <= X) && (sy - 1) > 0 && (sy + 1 <= Y)
        
        for i=sx-1:sx+1
           for j=sy-1:sy+1
              dist = abs(I(sx,sy) - I(i,j));
              if ((dist < 4) && (visited(i,j) == 0))
                  segmented(i,j) = 1;
                  iStack = iStack + 1;
                  stack(iStack,:) = [i j];
              end
              visited(i,j) = 1;
           end
        end
        
    end
end

imshow(uint8(segmented),[]);

%% średnia


close all;
clearvars;
clc;

%% wczytanie obrazu

I = imread('knee.png');
imshow(I);
%[x y] = ginput(1);
x = 262;
y = 264;
I = double(I);

[X Y] = size(I);

visited = zeros(X,Y);
segmented = zeros(X,Y);

stack = zeros(10000,2);
iStack = 1;

stack(iStack,:) = [x y];
visited(x,y) = 1;
segmented(x,y) = 1;

nS = 0
mV = 0;

%%
while (iStack > 0)
    sx = stack(iStack,1);
    sy = stack(iStack,2);
    iStack = iStack - 1;
    nS = nS + 1;
    mV = (mV*(nS-1)+I(sx,sy))/nS;
    if (sx - 1 > 0) && (sx + 1 <= X) && (sy - 1) > 0 && (sy + 1 <= Y)
        
        for i=sx-1:sx+1
           for j=sy-1:sy+1
              dist = abs(mV - I(i,j));
              if ((dist < 20) && (visited(i,j) == 0))
                  segmented(i,j) = 1;
                  iStack = iStack + 1;
                  stack(iStack,:) = [i j];
              end
              visited(i,j) = 1;
           end
        end
        
    end
end

imshow(uint8(segmented), []);