class StaticPagesController < ApplicationController
  def home
    @top_order_products = Product.top_order
  end
end
