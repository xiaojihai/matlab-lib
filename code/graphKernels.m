function [ker]=graphKernels(net,k,flag)
% function: computer the kernel matrix between subjects
% input
%   net: the adjacency matrix of graphs (size: dim*dim*n), dim-# nodes,
%   n-# subjects
%   k: the number of power iteration.
% output:the kerner matrix with size of n*n; 

N=size(net,3);
Ker=zeros(N,N);
for i=1:N
    for j=i+1:N
        Ker(i,j)=graphKer(net(:,:,i),net(:,:,j),k,flag);
    end
end
ker=Ker+Ker'+diag(ones(N,1));