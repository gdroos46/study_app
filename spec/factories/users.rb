# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :user do
    name "name"
    tel "08000000000"
    email "example@example.com"
    password { '11111111' }
  end
end
