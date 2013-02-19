require 'faker'

FactoryGirl.define do
  factory :phone_number do |f|
    f.name {Faker::Name.name}
    f.value {Faker::PhoneNumber.phone_number}
  end
end