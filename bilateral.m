function data_filtered = bilateral(data, local_window, sigmaR)

FUNCTION = @(data_, local_window_, sigmaR_)bilateral_local(data_, local_window_, sigmaR_);

data_filtered = colfilt(data, local_window, 'sliding', FUNCTION, local_window, sigmaR);

end