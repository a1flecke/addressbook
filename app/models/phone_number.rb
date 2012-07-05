class PhoneNumber < ActiveRecord::Base
  has_one :person
  has_one :family
  
  validates :name, :presence => true
  validates :value, :presence => true
  
  
end
