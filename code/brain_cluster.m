clc
compute_attribute_similarity;
subKer_demo;
 load('similarity.mat');
 dirname = '..\';%指定被试所在目录
cd(dirname);
for i=1:9
    p=i*0.1;
    A=p*attr+(1-p)*str;
    cspectclust;
   % save(['.\result\', 'similarity.mat'], 'attr');
    save(['.\result\','result_',num2str(p),'.mat'], 'c1', 'c2');
end 

     
