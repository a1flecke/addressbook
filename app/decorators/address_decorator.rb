class AddressDecorator < Draper::Decorator
  delegate_all
  decorates :address

  def inline
    "#{model.name}: #{model.street}, #{model.city}, #{model.state}  #{zip_code}"
  end

  def zip_code
    model.zipCode
  end
end