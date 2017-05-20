function [gK1, gK2, gK3] = grad_K_sqexp(X1, X2, theta)
%gradient of sq exp cov fn wrt theta
sigma_f = theta(1, 1);
l = theta(2, 1);
for itr1 = 1:size(X1, 1)
    for itr2 = 1:size(X2, 1)
        gK1(itr1, itr2) = (2 / sigma_f) * sq_exp(X1(itr1, :), X2(itr2, :), theta);
        gK2(itr1, itr2) = (sum((X1(itr1, :) - X2(itr2, :)) .^ 2) / (l ^ 3)) * sq_exp(X1(itr1, :), X2(itr2, :), theta);
        gK3(itr1, itr2) = 1;
        for itr3 = 1:size(X1, 2)
            if X1(itr1, itr3) ~= X2(itr2, itr3)
                gK3(itr1, itr2) = 0;
                break;
            end
        end
        %K(itr1, itr2) = X(itr2) - X(itr1);
    end
end
end
