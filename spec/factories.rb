FactoryGirl.define do

	factory :category do
    name "MyCategoryName"
    description "MyCategoryDescription"
  end
  
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password "password"
    password_confirmation "password"
    confirmed_at Time.zone.now

    factory :director do
      director true
    end
  end
end