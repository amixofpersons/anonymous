FactoryGirl.define do
  factory :user do
    name "waffles"
    password "test"
    sequence(:email) { |n| "idk@gmail.com"}
  end
end
