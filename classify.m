
load('testtt.mat');
TD = TestData;
TL = TestLabels;
load('testDataaa.mat')

predictedLabels = zeros(200,1);

Data = TD;

for iter = 1:200
    
    predictedLabels(iter) = SVMtree(TD(iter,1:356),...
                            rootBinary,...
                            lvl2LeftNhla,...
                            lvl2LeftNh,...
                            lvl2LeftNl,...
                            lvl2LeftNa,...
                            lvl2RightAhla,...
                            lvl2RightAh,...
                            lvl2RightAl,...
                            lvl2RightAa...
                            );
                            
    disp(iter);
end


confMat = confusionmat(TestLabels,predictedLabels);
accuracy = trace(confMat)/sum(sum(confMat));
confusionchart(confMat);
title('Test Data');

disp(accuracy);














