function k = sq_exp(xp, xq, theta)
%k = sq_exp(sigma_f, l, xp, xq)
%fn to return value of SE cov fn for arrays/ scalars xp and xq with
%hyperparameters sigma_f and l
% k = (sigma_f ^ 2) * exp(-1 / (2 * (l ^ 2)) * sum((xp - xq) .^ 2));
for itr = 1:size(xp)
    if xp(itr) ~= xq(itr)
        k = (theta(1, 1) ^ 2) * exp(-1 / (2 * (theta(2, 1) ^ 2)) * sum((xp - xq) .^ 2));
        break;
    end
    k = (theta(1, 1) ^ 2) * exp(-1 / (2 * (theta(2, 1) ^ 2)) * sum((xp - xq) .^ 2)) + (theta(3, 1) ^ 2);
end
end