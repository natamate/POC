function Split( Img,ys,ye,xs,xe )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

global minpodzial;
global progodchylenie;
global index;
global segRes;
global Mres;
okno = Img(ys:ye,xs:xe);
srednia = mean(okno(:));
odchylenie = std(okno(:));
bok1 = ye-ys;
bok2 = xe-xs;
if (odchylenie > progodchylenie) && (bok1 > minpodzial) && (bok2 > minpodzial)
    podzialy = floor((ys + ye)/2);
    podzialx = floor((xs + xe)/2);
    Split(Img,ys,podzialy,xs,podzialx);
    Split(Img,ys,podzialy,podzialx+1,xe);
    Split(Img,podzialy+1,ye,xs,podzialx);
    Split(Img,podzialy+1,ye,podzialx+1,xe);
else
    segRes(ys:ye,xs:xe) = index;
    index = index + 1;
    Mres(ys:ye,xs:xe) = srednia;
end


end

