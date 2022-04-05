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
theta_s = [0;theta(2:end)]; %因为不需要对第一个参数正则化，所以第一项为0
J = sum(-y .* log(sigmoid(X * theta)) - (1 - y) .* log(1 - sigmoid(X * theta)))/ m + (lambda / (2*m)) * sum(theta_s.^2); %计算代价函数
temp = ((sigmoid(X * theta) - y) .* X) / m; %临时数组存放计算结果
len = size(theta);
for i = 1 : len(1)
    grad(i) = sum(temp(:,i)); %求和得到梯度
end
grad = grad + (lambda / m) * theta_s;




% =============================================================

end
