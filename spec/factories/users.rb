# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    username "maks_ohs"
    token "token"
    email "maks_ohs@vk.com"
    password "password"
  end
end
