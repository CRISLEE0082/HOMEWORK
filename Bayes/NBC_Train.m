function [Py,Pxy]=NBC_Train(data,Par_mat,label)
N=size(data);
Element=unique(label);
wn=length(Element);
wm=size(Par_mat,1);
Py=zeros(1,wn);
Pxy=zeros(wm,wn);
for i=1:wn
   Py(i)=length(find(label==Element(i)))/length(label);
   for j=1:wm
       Mat_1=find(ismember(data,Par_mat(j,:),'rows')==1);
       Mat_2=find(label==Element(i));
       Pxy(j,i)=length(intersect(Mat_1,Mat_2))/length(find(label==Element(i)));
   end

end


end
    
    
