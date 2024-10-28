function probability = gaussian_distribution(X, mean_value, variance)
  [m, n] = size(X);
  probability = zeros(m, 1);

  probability = exp(-0.5 * (X - mean_value) * inv(variance) * (X - mean_value)');

endfunction
