class Backend::OrdersController < Backend::BaseController
  before_action :load_order, :load_order_items, only: %i(show update)

  def index
    @orders = if params[:search].present?
                search params[:search]
              else
                Order
              end.newest.includes(:user)
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

  def search value_search
    if Order.statuses.keys.include? value_search
      Order.by_status(value_search)
    else
      Order.by_name(value_search)
    end
  end

  def load_order
    @order = Order.find_by id: params[:id]
    return if @order
    flash[:danger] = t "orders.not_found"
    redirect_to backend_orders_path
  end

  def load_order_items
    @order_items = @order.order_items.includes :product
  end
end
