function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


% theta(2:end)で2行目から最後の行まで抜き出す
J = (1 / m) * sum(-y' * log(sigmoid(X * theta)) - (1 - y)' * log(1 - sigmoid(X * theta))) + (lambda / (2 * m)) * sum(theta(2:end) .^ 2);

% sumで各行が足されるので、横のベクトルになる
grad = (1 / m) * sum(X .* repmat(sigmoid(X * theta) - y, 1, size(X, 2))) + (lambda / m) .* theta';
grad(1) = (1 / m) * sum((sigmoid(X * theta) - y) .* X(:, 1));


% =============================================================

end
