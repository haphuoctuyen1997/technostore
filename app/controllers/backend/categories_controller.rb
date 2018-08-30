class Backend::CategoriesController < Backend::BaseController
  before_action :load_all_categories, only: %i(edit new)
  before_action :load_categoy, only: %i(edit update)

  def index
    @categories = if params[:search].present?
                    Category.search params[:search]
                  else
                    Category
                  end
                  .newest.paginate page: params[:page],
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

  def edit; end

  def update
    if @category.update_attributes category_params
      flash[:success] = t "category.update_success"
      redirect_to backend_categories_path
    else
      render :edit
    end
  end

  private

  def load_all_categories
    @categories = Category.newest.all
  end

  def load_categoy
    @category = Category.find_by id: params[:id]
    return if @category
    flash[:danger] = t "category.not_found"
    redirect_to backend_categories_path
  end

  def category_params
    params.require(:category).permit :name, :parent_id
  end
end
