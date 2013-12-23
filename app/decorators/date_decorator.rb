module DateDecorator
  def decorate_date(date)
    date.to_date.to_formatted_s
  end
end