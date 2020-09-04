FactoryBot.define do
  factory :user do
    nickname              { 'kakaka' }
    email                 { 'testman@co.jp' }
    password              { 'kakaka3' }
    password_confirmation { password }
    family_name           { '山田' }
    first_name            { '太郎' }
    birthday              { '1999-10-10' }
  end
end
