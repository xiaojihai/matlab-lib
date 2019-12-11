  
clc
%load('ADNI_MCI_NC_CONN.mat')
dirname = '.\subject data';%ָ����������Ŀ¼
indexlist = dir(dirname);
cd(dirname);
m = length(indexlist);
for indexnum = 3:m
    filename1 = [indexlist(indexnum).name];
    %cd(dirname);
    load(filename1);
    i = indexnum - 2; 
    NET(:,:,i)=T;%T��ʾһ�����Ե�������
end
net=NET;
%gnd=target';

% Thresholding
%T=0.25;
%net(net<T)=0;
%net(net>=T)=1;

% compute the similarity
k=3;%k=3
h=2;%h=2
%tic;
dirname = '..\';%ָ����������Ŀ¼
cd(dirname);
ker=getEgoNetKernel(net,k,h);
k=sum(ker.ker1,3);
p=max(max(k));
str=k/p;
str(str==1)=0;
dirname = '.\result\';%ָ����������Ŀ¼
cd(dirname);
load('similarity.mat');
save('similarity.mat', 'attr','str');
%toc;