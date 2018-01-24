function rIndex = root(tab, index)

rIndex = index;

while rIndex ~= tab(rIndex)
    rIndex = tab(rIndex);
end

end

