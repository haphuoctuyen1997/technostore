module Backend::CategoriesHelper
  def option_select categories
    categories.map{|category| [category.name, category.id]}
  end

  def parent parent_id
    return true if parent_id == Settings.category_roof
  end

  def index_in_page counter, page, per
    ct = counter + Settings.counter_default
    page.blank? ? ct : ct + (page.to_i - Settings.counter_default) * per
  end
end
