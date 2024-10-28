% Computes the probability density function of the multivariate gaussian distribution.
function probabilities = multivariate_gaussian(X, mean_values, variances)
   [m, n] = size(X);
   probabilities = zeros(m, 1);
   for i = 1:m
     probabilities(i) = gaussian_distribution(X(i), mean_values, variances) / ((2 * pi) ^ (n / 2) * sqrt(det(variances)));
   endfor
endfunction
