function LUT( obraz, przekodowanie )
    subplot(1,3,1);
    imshow(obraz);
    title('Oryginalny')
    subplot(1,3,2);
    
    plot(przekodowanie);
    title('Przekodowanie');
    ylim([0 200]);
    xlim([0 200]);
    daspect([1 1 1]);
    
    
    subplot(1,3,3);
    imshow(intlut(obraz,przekodowanie));
    title('Przekształcony');
end

