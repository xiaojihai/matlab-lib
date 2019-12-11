function [C,C2]=covarianceRepresentation(A,K,flag)
% computing covariance represenation
% input
%   A: the adjacency matrix
%   K: the number of power iterations.
% ouput
%   C: the covariance matrix.
if nargin<3
    flag=0;
end
C2=[];
n=size(A,1);
x0=ones(n,1);
for t=1:K
        B=A*x0;    
        x0=B/norm(B,1);
        M(:,t)=x0;
end
if (flag==0)
    C=cov(n*M);
else
    x1=ones(n,K);
    D=n*M-x1;
    C=D'*D/n;
end
    
%     x1=ones(K,1);
%     S=0;
%     for i=1:n
%         D=n*M(i,:)'-x1;
%         S=S+D*D';
%     end
%     C2=S/n;
