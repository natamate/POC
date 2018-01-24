function mTab = union(tab,p,q)

%Ip = p;
%Iq = q;
mTab = tab;

%if Ip > Iq
    %Ip = q;
    %Iq = p;
%end

mTab(root(tab,p)) = root(tab,q);

end
