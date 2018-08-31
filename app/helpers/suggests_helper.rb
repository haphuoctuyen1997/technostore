module SuggestsHelper
  def load_category data
    options_from_collection_for_select(data,
      :id, :name, include_blank: "")
  end
end
