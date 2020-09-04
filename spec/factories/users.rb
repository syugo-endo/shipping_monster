FactoryBot.define do
  factory :user do
    nickname {}
    email {}
    password {}
    password_confirmation {password}
  end
end