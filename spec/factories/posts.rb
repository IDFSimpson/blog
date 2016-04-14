FactoryGirl.define do
  factory :post do
    sequence(:title)         { |n| "#{Faker::Commerce.department}"}
    body                     {Faker::Lorem.paragraph}
  end
end
