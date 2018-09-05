module Backend::CategoriesHelper
  def option_select categories
    categories.map{|category| [category.name, category.id]}
  end
end
