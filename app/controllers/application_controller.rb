class ApplicationController < ActionController::Base
  protect_from_forgery

  def get_family(id)
  	FamilyDecorator.decorate(Family.find(id))
  end

  def get_address(id)
    debugger
    AddressDecorator.decorate(Address.find(id))
  end
end
