FactoryGirl.define do
  factory :user, :aliases => [:poster] do
    name "waffles"
    password "test"
    sequence(:email) { |n| "idk@gmail.com"}
  end
end
