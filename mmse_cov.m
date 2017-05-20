function k = mmse_cov(theta, xp, xq)
for itr = 1:size(xp, 2)
    if xp(itr) ~= xq(itr)
        k = (theta(1, 1) ^ 2) * exp(-1 / (2 * (theta(2, 1) ^ 2)) * sum((xp - xq) .^ 2)) + (theta(3, 1) * xp' * xq);
        break;
    end
    k = (theta(1, 1) ^ 2) * exp(-1 / (2 * (theta(2, 1) ^ 2)) * sum((xp - xq) .^ 2)) + (theta(3, 1) * xp' * xq) + (theta(4, 1) ^ 2);
end
end