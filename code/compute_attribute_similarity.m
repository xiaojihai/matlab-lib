%compute the characters of mst tree 
%function [] = compute_attribute_similarity()

dirname = '.\subject data';%指定被试所在目录
indexlist = dir(dirname);
cd(dirname);
m = length(indexlist);
tree = 0;
n = 90;
for indexnum = 3:m
    filename1 = [indexlist(indexnum).name];
  %  cd(dirname);
    load(filename1);
     tree = full(T);%原来是tree = full(tree);
      i = indexnum - 2;
      betweenness = betweenness_wei(tree);
    normalised_bc = betweenness/((n-1)*(n-2));
    all_bc(i,:) = normalised_bc;
end

% save('bc','all_bc');
 for a = 1:m-3
   for b = a+1:m-2
     d=all_bc(a,:).*all_bc(b,:);
     e=norm(all_bc(a,:),2)*norm(all_bc(b,:),2);
     between_similarity(a,b)=sum(d)/e;
     between_similarity(b,a)=sum(d)/e;
   end
 end
% between_similarity(1,1)=0;
  %  between_similarity(m,m)=0;
    attr=between_similarity;
    %attr(attr==1)=0;
 save(['..\result\', 'similarity.mat'], 'attr');
   
