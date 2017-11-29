function data_filtered = bilateral_local(data, local_window, sigmaR)

Nx = size(data,2);
    

data_filtered = zeros(Nx,1);

for i=1:Nx
    patch = reshape(data(:,i), local_window);
    
    [rows, cols] = find(patch == patch);
    rows = reshape(rows, local_window);
    cols = reshape(cols, local_window);
    Ncy = ceil(local_window(1)/2);
    Ncx = ceil(local_window(2)/2);
    dist = sqrt((Ncy - rows).^2 + (Ncx - cols).^2);
    diff = reshape(abs(data(:,i) - data(((Ncy-1)*local_window(1))+Ncx, i)), local_window);    
    gamma = exp(-((diff.^2)./(2*(sigmaR^2)))) .* dist; 
    
    data_filtered(i) = sum(sum(patch .* gamma))/sum(sum(gamma));
end

end

