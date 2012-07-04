class Address < ActiveRecord::Base
  has_one :family
  
  validates :name, :presence => true
  validates :street, :presence => true
  validates :city, :presence =>true
  validates :state, :presence=> true, :length=>{:maximum=>2, :minimum=>2}
end
