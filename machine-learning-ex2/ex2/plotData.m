function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%

% ベクトルyで1の部分のインデックスを返す
% octave:6> a = [1 2 3 4 1 2 3 4; 2 2 3 5 4 1 2 1]
% a =

% 1   2   3   4   1   2   3   4
% 2   2   3   5   4   1   2   1

% octave:7> find(a==1)
% ans =
% 1
% 9
% 12
% 16

pos = find(y == 1);
neg = find(y == 0);

% X(pos, 1)はposベクトルの行の1列目を返す
% X(pos, 2)はposベクトルの行の2列目を返す
plot(X(pos, 1), X(pos, 2), 'k+', 'LineWidth', 2, 'MarkerSize', 7);
plot(X(neg, 1), X(neg, 2), 'ko', 'LineWidth', 2, 'MarkerFaceColor', 'y', 'MarkerSize', 7);


% =========================================================================



hold off;

end
