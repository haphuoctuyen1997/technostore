class StaticPagesController < ApplicationController
  # before_action :category_all, only: :home

  def home
    @top_order_products = Product.top_order
    @products = Product.includes(:category).paginate page: params[:page],
      per_page: Settings.product_perpage
    @products_recent = Product.includes(:category).newest
  end
end
