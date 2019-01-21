# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :article do
    name '記事'
    description '説明'
    customer
    user
  end
end