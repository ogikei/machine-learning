function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

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



maxError = Inf;

for curC = [0.01 0.03 0.1 0.3 1 3 10 30]
  for curSigma = [0.01 0.03 0.1 0.3 1 3 10 30]
    % m = 211
    % X = m * 2
    % y = m * 1
    % y = 1 or 0
    model = svmTrain(X, y, curC, @(x1, x2) gaussianKernel(x1, x2, curSigma));
    % predictions = 1 or 0
    predictions = svmPredict(model, Xval);
    mean(double(predictions ~= yval));
    preError = mean(double(predictions ~= yval));
    if preError < maxError
      maxError = preError;
      C = curC;
      sigma = curSigma;
    end
  end
end



% =========================================================================

end
