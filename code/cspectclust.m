

%% step 2
%load 'data1.mat'
D = diag(sum(A'))
L=D^(-.5)*A*D^(-.5)
%subplot(2,3,3)
%imagesc(L); colorbar;


%% step 3 
[X,di]=eig(L)
[Xsort,Dsort]=eigsort(X,di)
Xuse=Xsort(:,1:2)
%subplot(2,3,4)
%imagesc(Xuse); colorbar;


%% normalize X to get Y (step 4)
Xsq = Xuse.*Xuse;
divmat=repmat(sqrt(sum(Xsq')'),1,2)
Y=Xuse./divmat
%subplot(2,3,5)
%imagesc(Y); colorbar;

%% step 5/6
[c,Dsum,z] = kmeans(Y,2)

kk=c;
c1=find(kk==1);
c2=find(kk==2);
%c3=find(kk==3);

%subplot(2,3,6)
%plot(allpts(c1,1),allpts(c1,2),'co')
%hold on;
%plot(allpts(c2,1),allpts(c2,2),'mo')
%title('with spectral clustering');


%% for comparison run kmeans on original data
%[cc,Dsum2,z2] = kmeans(allpts,2)
%subplot(2,3,1)

%kk=cc;
%c1=find(kk==1);
%c2=find(kk==2);

%plot(allpts(c1,1),allpts(c1,2),'co')
%plot(allpts(c2,1),allpts(c2,2),'mo')
%title('with k-means');

