class PhoneNumber < ActiveRecord::Base
  has_one :person
  has_one :family
end
