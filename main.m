close all
clear
clc

load('CL_Data.mat')
labels = [];

% standardizing data
for iter = 1:356
    mData = mean(CL_data(1:600,iter));
    vData = var(CL_data(1:600,iter));
    
    CL_data(1:600,iter) = (CL_data(1:600,iter) - mData )/sqrt(vData) ;
    
end

for iter = 1:356
    mData = mean(CL_data(601:1200,iter));
    vData = var(CL_data(601:1200,iter));
    
    CL_data(601:1200,iter) = (CL_data(601:1200,iter) - mData )/sqrt(vData) ;
    
end

%%% end of standardizing

% binary label into normal and aggressive

labelsA = [];
labelsN = [];

for iter = 11:20
   
    labelsA = [labelsA;iter.*ones(60,1)];
    
end

for iter = 1:10
   
    labelsN = [labelsN;iter.*ones(60,1)];
    
end

normalLabels  = ones(600,1);
aggLabels = normalLabels.*-1;
%%% end of binary labels


clear vData mData iter 

% shuffleN = randperm(600);
% shuffleA = randperm(600);

splitDataN = CL_data(601:1200,:);
splitDataA = CL_data(1:600,:);

% normalLabels = normalLabels(shuffleN);
% aggLabels = aggLabels(shuffleA);

% labelsN = labelsN(shuffleN);
% labelsA = labelsA(shuffleA);

% splitDataN = splitDataN(shuffleN,:);
% splitDataA = splitDataA(shuffleA,:);

CL_data = [splitDataA(1:600,:);splitDataN(1:600,:)];
% CL_data = [splitDataA(1:500,:);splitDataN(1:500,:)];
% TestData = [splitDataA(501:end,:);splitDataN(501:end,:)];
% TestLabels = [labelsA(501:end,:);labelsN(501:end,:)];
% labelsN = labelsN(1:500);
% labelsA = labelsA(1:500);
% aggLabels = aggLabels(1:500);
% normalLabels = normalLabels(1:500);
%%%%%%%%%%

labels = [labelsA;labelsN];
binaryLabels = [aggLabels;normalLabels];
Data2 = [CL_data,binaryLabels];
Data1 = [CL_data,labels];
Data = [CL_data,labels];


DataNormal = Data(501:end,:);
DataAgg = Data(1:500,:);

DataAggHandIndices = [find(Data(:,357) == 11);...
                            find(Data(:,357) == 16);...
                                find(Data(:,357) == 17);...
                                    find(Data(:,357) == 18);...
                                        find(Data(:,357) == 20)];
                                    
DataAggLegIndices = [find(Data(:,357) == 12);...
                            find(Data(:,357) == 15);...
                                find(Data(:,357) == 19);];       
                            
DataAggAmbiIndices = [find(Data(:,357) == 13);...
                            find(Data(:,357) == 14)];       
                            
DataNormalHandIndices = [find(Data(:,357) == 2);...
                            find(Data(:,357) == 3);...
                                find(Data(:,357) == 4);...
                                    find(Data(:,357) == 10)];
                                    
DataNormalLegIndices = [find(Data(:,357) == 5);...
                            find(Data(:,357) == 6);...
                                find(Data(:,357) == 9);];       
                            
DataNormalAmbiIndices = [find(Data(:,357) == 1);...
                            find(Data(:,357) == 7);...
                                find(Data(:,357) == 8)];                    
                        
DataNHand = Data(DataNormalHandIndices,:);                                    
DataNLeg = Data(DataNormalLegIndices,:);
DataNAmbi = Data(DataNormalAmbiIndices,:);

DataAHand = Data(DataAggHandIndices,:);
DataALeg = Data(DataAggLegIndices,:);
DataAAmbi = Data(DataAggAmbiIndices,:);
                                 
Data(DataAggHandIndices,357) = 21;
Data(DataAggLegIndices,357) = 22;
Data(DataAggAmbiIndices,357) = 23;

Data(DataNormalHandIndices,357) = 24;
Data(DataNormalLegIndices,357) = 25;
Data(DataNormalAmbiIndices,357) = 26;

DataNormal2 = Data(501:end,:);
DataAgg2 = Data(1:500,:);
