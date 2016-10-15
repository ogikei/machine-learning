function plotDecisionBoundary(theta, X, y)
%PLOTDECISIONBOUNDARY Plots the data points X and y into a new figure with
%the decision boundary defined by theta
%   PLOTDECISIONBOUNDARY(theta, X,y) plots the data points with + for the 
%   positive examples and o for the negative examples. X is assumed to be 
%   a either 
%   1) Mx3 matrix, where the first column is an all-ones column for the 
%      intercept.
%   2) MxN, N>3 matrix, where the first column is all-ones

% Plot Data
plotData(X(:,2:3), y);
hold on

% Xの列数が3以下の場合、
if size(X, 2) <= 3
    % Only need 2 points to define a line, so choose two endpoints
    % plot_x =
    % 28.059   101.828
    plot_x = [min(X(:,2))-2,  max(X(:,2))+2];

    % Calculate the decision boundary line
    % plot_y =
    % 96.166   20.653
    % (theta(1) + theta(2) * x1) * (-1 / theta(3))の一次関数式
    plot_y = (-1./theta(3)).*(theta(2).*plot_x + theta(1));

    % Plot, and adjust axes for better viewing
    % plot([1 2], [1 2])の場合、xが1でyが1、xが2でyが2を通る直線を引く
    plot(plot_x, plot_y)
    
    % Legend, specific for the exercise
    legend('Admitted', 'Not admitted', 'Decision Boundary')
    % 軸の範囲の変更
    % 軸の範囲を変更するには、関数 axis に [xmin,xmax,ymin,ymax] の形式の 4 成分ベクトルを渡す
    % xmin と xmax は X 軸のスケーリングを設定し、ymin と ymax は Y 軸のスケーリングを設定します
    axis([30, 100, 30, 100])
else
    % Here is the grid range
    % 線形に等間隔なベクトルを作成する、下記の例は-5~5までの範囲内で、7個の要素のベクトルを作成する
    % y1 = linspace(-5,5,7)
    % y1 =
    % -5.00000  -3.33333  -1.66667   0.00000   1.66667   3.33333   5.00000
    u = linspace(-1, 1.5, 50);
    v = linspace(-1, 1.5, 50);

    z = zeros(length(u), length(v));
    % Evaluate z = theta*x over the grid
    for i = 1:length(u)
        for j = 1:length(v)
            z(i,j) = mapFeature(u(i), v(j))*theta;
        end
    end
    z = z'; % important to transpose z before calling contour

    % Plot z = 0
    % Notice you need to specify the range [0, 0]
    contour(u, v, z, [0, 0], 'LineWidth', 2)
end
hold off

end
