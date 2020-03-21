(0..rand(20..25)).each_with_index do |index|
  step = Step.create(
    ordinal: index, 
    name: Faker::Hipster.sentence,
    description: Faker::Hipster.paragraph)
  puts step.inspect
end