require 'date'

class FamilyDecorator < Draper::Decorator
  delegate_all
  decorates :family

	def anniversary
		if anniversary?
			return DateTime.parse(model.anniversary)
		else
			return nil
		end
	end

end