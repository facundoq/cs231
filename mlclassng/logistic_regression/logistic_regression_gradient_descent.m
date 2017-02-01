function [new_model,error]=logistic_regression_gradient_descent(model,alpha,x,y)
%error=mean((y_hat-y).^2)/2
y_hat=logistic_regression_classify(model,x);
delta=  (x' * (y_hat-y)) / length(y) ;
new_model=model-alpha * delta;
error=logistic_regression_error(model,x,y);