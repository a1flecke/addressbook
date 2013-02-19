require 'faker'

FactoryGirl.define do
  factory :email do |f|
  	f.value {Faker::Internet::email}
  end

  factory :invalid_email, parent: :email do |f|
  	f.value nil
  end
end