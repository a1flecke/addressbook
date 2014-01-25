class Address < ActiveRecord::Base
  has_one :family
  scope :for_family, ->(family) {where(family_id: family.id)}
  
  validates :name, :presence => true
  validates :street, :presence => true
  validates :city, :presence => true
  validates :state, :presence => true, :length=>{:maximum=>2, :minimum=>2}, format: { with: /\b(AA|AL|AK|AS|AZ|AR|CA|CO|CT|DE|DC|FM|FL|GA|GU|HI|ID|IL|IN|IA|KS|KY|LA|ME|MH|MD|MA|MI|MN|MS|MO|MT|NE|NV|NH|NJ|NM|NY|NC|ND|MP|OH|OK|OR|PW|PA|PR|RI|SC|SD|TN|TX|UT|VT|VI|VA|WA|WV|WI|WY)\b/, :message=>'%{value} is invalid'}
  validates :zipCode, :presence => true, format: { with: /\b[0-9]{5}(?:-[0-9]{4})?\b/ }
end
