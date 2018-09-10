module OrdersHelper
  def day_format
    Date.today.strftime(" %d-%m-%Y ")
  end

  def created_at_format date
    date.strftime("%I:%M %p %d-%m-%Y")
  end
end
