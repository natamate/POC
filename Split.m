function Split( Image, yS, yE, xS, xE)
    %% arg :
    %% Obraz
    %% i cztery wspolrzedne analizowanego podobszaru

    global minpodzial; 
    global progodchylenie;
    global index;
    global segRes;
    global Mres;

    %% zamiana obrazu na wektor
    wektor = Image(yS:yE,xS:xE);

    srednia = mean(wektor(:));

    odchylenie = std(wektor(:));

    bok1 = yE - yS;
    bok2 = xE - xS;

    %% spr czy odchylenie mniejsze
    if (odchylenie > progodchylenie) && (bok1 > minpodzial) && (bok2 > minpodzial)

        %% wyznacz rozmiar aktualnego podobszaru
        podzialY = floor((yS + yE)/2);
        podzialX = floor((xS + xE)/2);

        %% podzial na cztery czesci jesli podobszar nie jest jednorodny i nie osiagnelismy min rozmiaru
        Split(Image,yS,podzialY,xS,podzialX);
        Split(Image,yS,podzialY,podzialX+1,xE);
        Split(Image,podzialY+1,yE,xS,podzialX);
        Split(Image,podzialY+1,yE,podzialX+1,xE);
    else
        %% podobszar jednorodny or nie mozemy dalej dzielic
        %% w macierzy segRes zapisujemy jednorodne obszary
        %% index globalny licznik podobszarow
        segRes(yS:yE,xS:xE) = index;
        index = index + 1;
        %% zapisujemy srednia podobszaru
        Mres(yS:yE,xS:xE) = srednia;
    end

end
