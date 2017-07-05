function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% Seems optimal:
% C = 0.28;
% sigma = 0.8;

C = 0.3;
sigma = 0.1;
% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

% UNCOMMENT to find better values
%{
maxError = Inf;

Clist = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
sigmalist = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];

for testC = Clist
  for testsigma = sigmalist
    model = svmTrain(X,y, testC, @(x1, x2) gaussianKernel(x1, x2, testsigma));
    predictions = svmPredict(model, Xval);
    
    pError = mean(double(predictions ~= yval));
    
    if pError < maxError
      maxError = pError;
      C = testC;
      sigma = testsigma;
    end
  end
end  
    
%}
% =========================================================================

end
