function Split( Image, ys, ye, xs, xe)

global minpodzial; 
global progodchylenie;
global index;
global segRes;
global Mres;

okno = Image(ys:ye,xs:xe);
srednia = mean(okno(:));
odchylenie = std(okno(:));
bok1 = ye-ys;
bok2 = xe-xs;
if (odchylenie > progodchylenie) && (bok1 > minpodzial) && (bok2 > minpodzial)
    podzialy = floor((ys + ye)/2);
    podzialx = floor((xs + xe)/2);
    Split(Image,ys,podzialy,xs,podzialx);
    Split(Image,ys,podzialy,podzialx+1,xe);
    Split(Image,podzialy+1,ye,xs,podzialx);
    Split(Image,podzialy+1,ye,podzialx+1,xe);
else
    segRes(ys:ye,xs:xe) = index;
    index = index + 1;
    Mres(ys:ye,xs:xe) = srednia;
end


end

