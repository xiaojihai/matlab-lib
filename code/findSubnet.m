function [ind_subnet]=findSubnet(net,h)
% function: find the subnet for each vertex of network.
% input:
%   net: the orignal network
%   h: the number of the level of subnet.
% output:
%   ind_subnet: the index of subnet of each vertex.
%   

for i=1:size(net,1)
    ind=i;
    ind_all=ind;
    for j=1:h
        [row,col]=find(net(ind,:)~=0);
        ind=unique(col);
        if size(col,1)>1
           ind_all=[ind_all ind'];
        else
           ind_all=[ind_all ind];
        end
    end
    ind_all=sort(unique(ind_all));
    subnet{i}=ind_all;    
end
ind_subnet=subnet;