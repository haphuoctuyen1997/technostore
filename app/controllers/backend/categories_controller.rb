class Backend::CategoriesController < Backend::BaseController
  before_action :load_level_category, only: :destroy
  before_action :load_categoy, only: %i(edit update destroy)
  before_action :load_selects, only: %i(edit new)

  def index
    @categories = if params[:search].present?
                    Category.search params[:search]
                  else
                    Category
                  end.newest.paginate page: params[:page],
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

  def destroy
    ActiveRecord::Base.transaction do
      destroy_all_childs
      @category.destroy!
    end
    flash[:success] = t "category.destroy_success"
    redirect_to backend_categories_path
  rescue ActiveRecord::RecordNotDestroyed
    flash[:danger] = t "category.destroy_error"
    redirect_to backend_categories_path
  end

  private

  def destroy_all_childs
    if @parents.include? @category
      @childs1.each do |child1|
        next unless child1.parent_id == @category.id
        @childs2.each do |child2|
          child2.destroy! if child2.parent_id == child1.id
        end
        child1.destroy!
      end
    elsif @childs1.include? @category
      @childs2.each do |child2|
        child2.destroy! if child2.parent_id == @category.id
      end
    end
  end

  def load_level_category
    @parents = Category.find_parent
    @childs1 = Category.find_child(@parents)
    @childs2 = Category.find_child(@childs1)
  end

  def load_all_categories
    @categories = Category.newest.all
  end

  def load_categoy
    @category = Category.find_by id: params[:id]
    return if @category
    flash[:danger] = t "category.not_found"
    redirect_to backend_categories_path
  end

  def load_selects
    load_all_categories
    @selects = []
    @categories.each do |category|
      next unless category.parent_id == Settings.category_roof
      @selects << category
      @categories.each do |item|
        @selects << item if item.parent_id == category.id
      end
    end
  end

  def category_params
    params.require(:category).permit :name, :parent_id
  end
end
