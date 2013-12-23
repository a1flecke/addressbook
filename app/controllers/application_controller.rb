class ApplicationController < ActionController::Base
  protect_from_forgery

  def get_family(id)
    family = Family.find(id)
    return nil if family.nil?
  	FamilyDecorator.decorate(family)
  end

  def get_address(id)
    address = Address.find(id)
    return nil if address.nil?
    AddressDecorator.decorate(address)
  end

  def get_person(id)
    person = Person.find(id)
    return nil if person.nil?
    PersonDecorator.decorate(person)
  end    
end
