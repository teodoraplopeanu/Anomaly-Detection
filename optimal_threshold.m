function [best_epsilon best_F1 associated_precision associated_recall] = optimal_threshold(truths, probabilities)
  % Initializare
  [n, m] = size(probabilities);
  best_epsilon = 0;
  best_F1 = 0;
  associated_precision = 0;
  associated_recall = 0;
  predictions = zeros(n);
  
  minim = min(probabilities);
  maxim = max(probabilities);
  step = (maxim - minim) / 1000;

  % Calcularea best_epsilon
  for epsilon = minim:step:maxim
    predictions = probabilities < epsilon;

    [false_positives, false_negatives, true_positives] = check_predictions(predictions, truths);

    [precision, recall, F1] = metrics(true_positives, false_positives, false_negatives);

    if F1 > best_F1
      best_epsilon = epsilon;
      best_F1 = F1;
      associated_precision = precision;
      associated_recall = recall;
    endif
  endfor
endfunction