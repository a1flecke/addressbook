class Address < ActiveRecord::Base
  has_one :family
  
  validates :name, :presence => true
  validates :street, :presence => true
  validates :city, :presence => true
  validates :state, :presence => true, :length=>{:maximum=>2, :minimum=>2}
  validates :zipCode, :presence => true, format: { with: /\b[0-9]{5}(?:-[0-9]{4})?\b/ }
end
