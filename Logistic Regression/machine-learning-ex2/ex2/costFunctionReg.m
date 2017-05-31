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
for N = 1:m
  termSig = sigmoid(theta'*X(N,:)');
  term1 = -y(N)*log(termSig);
  term2 = -(1-y(N))*log(1 - termSig);
  J += term1 + term2;
  grad += (sigmoid(theta'*X(N,:)') - y(N))*X(N,:)';
endfor

% Regularize the term
regTheta = 0;
for N = 2:length(theta)
  regTheta += theta(N)^2;
endfor

regTheta = regTheta*lambda/(2*m);
J /= m;
J += regTheta;
grad /= m;
theta = [0; theta(2:end)];
grad += (lambda/m)*(theta);





% =============================================================

end
