function [mean_values variances] = estimate_gaussian(X)
  [m, n] = size(X);
  mean_values = zeros(1, n);
  variances = zeros(n, n);

  % Determinarea mean_values
  for i = 1:n
    mean_values(i) = sum(X(:,i)) / m;
  endfor

  % Determinarea matricei de varianta
  for i = 1:m
    variances = variances + ((X(i,:) - mean_values)' * (X(i,:) - mean_values));
  endfor
  variances = variances / m;
endfunction
