class Backend::OrdersController < Backend::BaseController
  before_action :load_order, only: %i(show update)

  def index
    @orders = Order.newest.includes(:user)
                   .paginate page: params[:page], per_page: Settings.per_order
  end

  def show; end

  def update
    status = if params[:status].to_i == Settings.order.accepted
               :accepted
             else
               :rejected
             end
    return unless @order.send("#{status}!")
    flash.now[:success] = t "orders.#{status}"
    render :show
  rescue ActiveRecord::RecordNotSaved
    flash.now[:danger] = t "orders.fail"
    render :show
  end

  private

  def load_order
    @order = Order.find_by id: params[:id]
    return if @order
    flash[:danger] = t "orders.not_found"
    redirect_to backend_orders_path
  end
end
