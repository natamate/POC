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
    y = abs(patch - patch(Ncy,Ncx));
    h = exp(((-1)*(y .* y))/(2*sigmaR^2));
    
    psi = exp(((-1)*(dist .* dist))/(2*sigmaR^2));
    
    data_filtered(i) = sum(sum(psi .* patch .* h)) / sum(sum(psi .* h));     
end

end