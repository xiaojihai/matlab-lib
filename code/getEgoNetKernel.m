function [kernel]=getEgoNetKernel(net,k,h,flag)
% function: compute the graph kernel for ego network of each subjects
% input
%   net: the adjacent matrix of all subjects (size dim*dim*n) dim - # nodes of network;n: #
%   subjects
%   k: the number of power iteration.
%   h: the number of the level of subnet.
% output
%   kernel: the kernel matrix of all subjects at each ego-network
%   ker1: the kernel matrix with non-constraint of pair-vertex.
%   ker2: the kernel matrix with constraint of pair-vertex.
if( nargin<4)
    flag=0;
end
NET=net;
n=size(NET,3);
dim=size(NET,1);
C=zeros(dim,dim);
ker1=zeros(n,n,dim);
ker2=ker1;
for s1=1:n;
    A=NET(:,:,s1);
    ind_A=findSubnet(A,h);
    for s2=s1+1:n
        B=NET(:,:,s2);         
        ind_B=findSubnet(B,h);        
        for i=1:dim
            inda=ind_A{i};
            indb=ind_B{i};
            if (length(inda)>1 && length(indb)>1)
               %toc
                ker1(s1,s2,i)=real(graphKer(A(inda,inda),B(indb,indb),k,flag));
                %tic
%                 subnet_a=C;
%                 subnet_b=C;
%                 subnet_a(inda,inda)=A(inda,inda);
%                 subnet_b(indb,indb)=B(indb,indb);            
%                 ker2(s1,s2,i)=real(graphKer(subnet_a,subnet_b,k,flag));% for comparsion;  
            end
        end
    end
end
for i=1:dim
    ker1(:,:,i)=ker1(:,:,i)+ker1(:,:,i)'+diag(ones(n,1));
    ker2(:,:,i)=ker2(:,:,i)+ker2(:,:,i)'+diag(ones(n,1));
end
kernel.ker1=ker1;
kernel.ker2=ker2;