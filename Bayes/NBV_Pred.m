function [Test_label]=NBV_Pred(Test_data,Pxy,Py)
global Par_set SibSp_cla;
P_Idx=Pxy.*Py;
[~,Index]=max(P_Idx,[],2);
Test_label=zeros(size(Test_data,1),1);
for m=1:size(Test_data,1)
    Test_index=find(ismember(Par_set,Test_data(m,:),'row'));
    Test_label(m)=SibSp_cla(Index(Test_index));
end

end
    
    

