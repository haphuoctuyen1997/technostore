class Backend::CategoriesController < Backend::BaseController
  before_action :load_all_categories, only: :new

  def index
    @categories = Category.newest.paginate page: params[:page],
     per_page: Settings.per_category
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t "category.create_success"
      redirect_to new_backend_category_path
    else
      load_all_categories
      render :new
    end
  end

  private

  def load_all_categories
    @categories = Category.newest.all
  end

  def category_params
    params.require(:category).permit :name, :parent_id
  end
end
