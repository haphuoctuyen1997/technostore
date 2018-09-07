module OrdersHelper
  def day_format
    Date.today.strftime(" %d-%m-%Y ")
  end

  def created_at_format date
    date.strftime("%I:%M %p %d-%m-%Y")
  end

  def status_color order
    status_key = Order.statuses[order.status]
    if status_key == Settings.order.pending
      "bg-warning"
    elsif status_key == Settings.order.accepted
      "bg-success"
    elsif status_key == Settings.order.rejected
      "bg-danger"
    end
  end
end
