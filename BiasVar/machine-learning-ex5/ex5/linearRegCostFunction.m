function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.

% ====================== COST ===============================
% X = 12 x 2, theta = 2 x 1; X*theta = 12x1;

% z is the hypothesis
z = X*theta; 
J = (1/(2*m))*sum((z-y).^2) + (lambda/(2*m))*(sum(theta(2:end).^2));



% ======================= GRAD ===============================
theta2 = theta;
theta2(1) = 0;
grad = (1/m)*((z-y)'*X) + (lambda/m)*theta2';









% =========================================================================

grad = grad(:);

end
