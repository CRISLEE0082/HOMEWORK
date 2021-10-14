
% Data preprocessing
Primitive_Data=readtable('C:\Users\74731\Desktop\data\wine.csv');
Train_Data=table2array(Primitive_Data(:,2:14));
Train_Mean=mean(Train_Data,1);
Train_Std=std(Train_Data,1);
Train_Norm=(Train_Data-Train_Mean)./Train_Std;

% Draw Scatter of a few couples of variable
figure;
subplot(1,2,1);
scatter(Train_Norm(:,1),Train_Norm(:,2),'+');
subplot(1,2,2);
scatter(Train_Norm(:,1),Train_Norm(:,3),'*');

% Calculate the Aiming Matrix
Aim_Mat=Train_Norm'*Train_Norm;

% Calculate the eigen vectors of the matrix
[Vector,Value]=eig(Aim_Mat);

Gain=sort(Train_Norm*Vector,1,'descend');

% Do the PCA with 3_dimensional Matrix
Train_PCA=Gain(:,1:3);

disp(Train_PCA);

% Show the distributions
figure;
plot3(Train_PCA(:,1),Train_PCA(:,2),Train_PCA(:,3),'d');


