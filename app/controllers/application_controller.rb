class ApplicationController < ActionController::Base
  protect_from_forgery

  def get_family(id)
    family = Family.find(id)
    nil if family.nil?
  	FamilyDecorator.decorate(family)
  end

  def get_address(id)
    address = Address.find(id)
    nil if address.nil?
    AddressDecorator.decorate(address)
  end
end
