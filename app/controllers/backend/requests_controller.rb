class Backend::RequestsController < Backend::BaseController
  before_action :load_request, only: %i(update destroy)
  def index
    @requests = Suggest.includes(:user, :category)
  end

  def update
    @request.accept!
    respond_to do |format|
      format.json{render json: {request: @request}}
      format.html
    end
  end

  def destroy
    @request.cancel!
    respond_to do |format|
      format.json{render json: {request: @request}}
      format.html
    end
  end

  private
  def load_request
    @request = Suggest.find params[:id]
  end

  def request_params
    params.require(:suggest).permit :status
  end
end
