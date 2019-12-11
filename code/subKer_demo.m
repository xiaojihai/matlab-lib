  
clc
%load('ADNI_MCI_NC_CONN.mat')
dirname = '.\subject data';%指定被试所在目录
indexlist = dir(dirname);
cd(dirname);
m = length(indexlist);
for indexnum = 3:m
    filename1 = [indexlist(indexnum).name];
    %cd(dirname);
    load(filename1);
    i = indexnum - 2; 
    NET(:,:,i)=T;%T表示一个被试的脑网络
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
dirname = '..\';%指定被试所在目录
cd(dirname);
ker=getEgoNetKernel(net,k,h);
k=sum(ker.ker1,3);
p=max(max(k));
str=k/p;
str(str==1)=0;
dirname = '.\result\';%指定被试所在目录
cd(dirname);
load('similarity.mat');
save('similarity.mat', 'attr','str');
%toc;