function [gK1, gK2, gK3, gK4] = grad_K_mmse(X1, X2, theta)
%gradient of sq exp cov fn wrt theta
for itr1 = 1:size(X1, 1)
    for itr2 = 1:size(X2, 1)
        gK1(itr1, itr2) = (2 / theta(1, 1)) * sq_exp(theta(1, 1), theta(2, 1), X1(itr1, :), X2(itr2, :));
        gK2(itr1, itr2) = (sum((X1(itr1, :) - X2(itr2, :)) .^ 2) / (theta(2, 1) ^ 3)) * sq_exp(X1(itr1, :), X2(itr2, :), theta(1:3, 1));
        gK3(itr1, itr2) = sum((X1(itr1, :) - X2(itr2, :)) .^ 2);
        gK4(itr1, itr2) = 1;
        for itr3 = 1:size(X1, 2)
            if X1(itr1, itr3) ~= X2(itr2, itr3)
                gK4(itr1, itr2) = 0;
                break;
            end
        end
        %K(itr1, itr2) = X(itr2) - X(itr1);
    end
end
end
