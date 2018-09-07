class Backend::OrdersController < Backend::BaseController
  def index
    @orders = Order.newest.includes(:user)
                   .paginate page: params[:page], per_page: Settings.per_order
  end
end
