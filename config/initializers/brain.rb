positive = File.readlines(Rails.root.join('app', 'data', 'positive-words.txt')).map(&:chomp)
negative = File.readlines(Rails.root.join('app', 'data', 'negative-words.txt')).map(&:chomp)

$brain = NBayes::Base.new
$brain.train(positive, 'POSITIVE')
$brain.train(negative, 'NEGATIVE')

