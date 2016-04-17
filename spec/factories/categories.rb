FactoryGirl.define do
  factory :category do
    sequence(:title) {|n| "#{n}-#{Faker::Hacker.adjective}" }   
  end
end
