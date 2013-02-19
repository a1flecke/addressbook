require 'faker'

FactoryGirl.define do
  factory :comment do |f|
  	f.value {Faker::Lorem::word}
  end

  factory :invalid_comment, parent: :comment do |f|
  	f.value nil
  end
end