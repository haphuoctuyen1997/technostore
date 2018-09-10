class OrdersController < ApplicationController
  before_action :category_all, only: %i(index new)

  def index
    @oders = Order.paginate page: params[:page], per_page: Settings.per_page
  end

  def new; end

  def show; end
end
