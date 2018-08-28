class Backend::StaticPageController < Backend::BaseController
  def index
    logged_in_user
  end
end
