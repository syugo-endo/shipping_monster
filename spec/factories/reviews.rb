FactoryBot.define do
  factory :review do
    name            { 'abe' }
    content         { 'aaaa0000' }
    score           { 2 }

    association         :user
  end
end
