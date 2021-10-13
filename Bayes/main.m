global Par_set SibSp_cla
% data preprocessing

% load primitive data
Titanic_Train=readtable('C:\Users\74731\Documents\Tencent Files\747315869\FileRecv\train.csv');

% fulfill the misising data
Age_Exist=find(~isnan(Titanic_Train.Age));
Age_Fillna=mean(Titanic_Train.Age(Age_Exist));
Age_Nan=find(isnan(Titanic_Train.Age));
for i=1:length(Age_Nan)
    Titanic_Train.Age(Age_Nan(i))=round(Age_Fillna);
end

% labeling
Sex_cla=unique(Titanic_Train.Sex)';
Pclass_cla=unique(Titanic_Train.Pclass)';
Age_cla=[0 1 2 3 4 ];
Fare_cla=[0 1 2 3 4 ];
SibSp_cla=unique(Titanic_Train.SibSp);
Sex_cla1=[0 1];

% regenerate parameter matrix
Train_par=zeros(size(Titanic_Train,1),4);
for j=1:size(Titanic_Train,1)
    Train_par(j,1)=Jud_Age(Titanic_Train.Age(j));
    Train_par(j,2)=Jud_Fare(Titanic_Train.Fare(j));
    Train_par(j,3)=strcmp(char(Titanic_Train.Sex(j)),char(Sex_cla(2)));
    Train_par(j,4)=Titanic_Train.Pclass(j);
end
Train_label=Titanic_Train.SibSp;

ind=fullfact([length(Age_cla) length(Fare_cla) length(Sex_cla1) length(Pclass_cla)]);
Par_set=[reshape(Age_cla(ind(:,1)),[],1) reshape(Fare_cla(ind(:,2)),[],1) reshape(Sex_cla1(ind(:,3)),[],1) reshape(Pclass_cla(ind(:,4)),[],1)];
% train bayes classifier
[py,pxy]=NBC_Train(Train_par,Par_set,Train_label);

% load primitive test data
Titanic_Test=readtable('C:\Users\74731\Documents\Tencent Files\747315869\FileRecv\test.csv');

%drop the missing data
Titanic_Testfix=Titanic_Test(all(~isnan(Titanic_Test.Age),5),:);
Test_par=zeros(size(Titanic_Testfix,1),4);

for k=1:size(Titanic_Testfix,1)
    Test_par(k,1)=Jud_Age(Titanic_Testfix.Age(k));
    Test_par(k,2)=Jud_Fare(Titanic_Testfix.Fare(k));
    Test_par(k,3)=strcmp(char(Titanic_Testfix.Sex(k)),char(Sex_cla(2)));
    Test_par(k,4)=Titanic_Testfix.Pclass(k);
end
Test_Label=Titanic_Testfix.SibSp;
%testing
[pred_label]=NBV_Pred(Test_par,pxy,py);
% check the correction
% calculate matched labels
Correct_Tag=0;
for n=1:length(pred_label)
    if pred_label(n)==Test_Label(n)
        Correct_Tag=Correct_Tag+1;
    else
        continue
    end
    
end

% calculate precision
Precision_Prob=Correct_Tag/length(Test_Label);
disp(Precision_Prob);












    


