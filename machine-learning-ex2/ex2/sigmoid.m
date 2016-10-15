function g = sigmoid(z)
%SIGMOID Compute sigmoid functoon
%   J = SIGMOID(z) computes the sigmoid of z.

% You need to return the following variables correctly 
g = zeros(size(z));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the sigmoid of each value of z (z can be a matrix,
%               vector or scalar).

% 割り算は.をつけて全体の要素に適用できるようにしないといけない
% A .* Bの場合、A, Bは同じ次元でなければならない
% この場合、同じ場所にある各要素をかけた行列を出力する

g = 1 ./ (1 + exp(-z))

% =============================================================

end
