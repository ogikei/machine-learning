function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%

% Theta1 -> 4 * 3
% Theta2 -> 4 * 5
% X -> 16 * 2

% X -> 16 * 3
X = [ones(m, 1) X];

% Z2 -> 16 * 4
Z2 = X * Theta1';

% A2 -> 16 * 4
A2 = sigmoid(Z2);

% A2 -> 16 * 5
A2 = [ones(size(A2, 1), 1) A2];

% Z3 -> 16 * 4
Z3 = A2 * Theta2';

% A3 -> 16 * 4
h = sigmoid(Z3);

% p_max -> 16 * 1
% p -> 16 * 1
[p_max, p] = max(h, [], 2)



% =========================================================================


end