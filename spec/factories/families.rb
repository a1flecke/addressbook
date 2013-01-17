require 'faker'

FactoryGirl.define do
  factory :family do |f|
    f.name {Faker::Name.name}
  end
end