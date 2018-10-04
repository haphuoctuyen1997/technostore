class ProductsController < ApplicationController
  before_action :load_product, only: :show

  def index
    @products = Product.by_category(params[:category]).by_name(params[:name])
                       .by_min_price(params[:min]).by_max_price(params[:max])
                       .paginate page: params[:page],
                         per_page: Settings.per_product
  end

  def show
    @comment = Comment.new
    @comments = Comment.comment_product(@product.id).newest
                       .paginate page: params[:page], per_page: Settings
                .per_page
  end

  private
  def paginate_comment
    paginate page: params[:page], per_page: Settings.per_page
  end

  def load_product
    @product = Product.find_by id: params[:id]
    return if @product
    flash[:danger] = t "error.product_not_found"
    redirect_to root_path
  end
end
