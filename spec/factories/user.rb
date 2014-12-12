FactoryGirl.define do
  factory :user, :aliases => [:poster] do
    name { Faker::Name.first_name }
    password "test_pass"
    email { Faker::Internet.email }
  end
end
