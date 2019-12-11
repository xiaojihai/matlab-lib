function [ker]=graphKer(A,B,K,flag)
% function: computer the similarity between two graphs A and B
% input
%   A, B: the adjacency matrix of graphs A and B
%   K: the number of power iteration.
% output:the graph kerner between graphs A and B
if (nargin<4)
    flag=0;
end
CA=covarianceRepresentation(A,K,flag);
CB=covarianceRepresentation(B,K,flag);
eps1=0.00001*diag(ones(size(CA,1),1));
CA=CA+eps1;
CB=CB+eps1;
d1=real(det((CA+CB)/2));
tmp=real(det(CA)*det(CB));
d2=sqrt(tmp);
dist=log(d1/d2);
ker=exp(-dist/2);