class Backend::UsersController < Backend::BaseController
  before_action :load_user, except: %i(index new create)
  before_action :load_roles, only: %i(edit new)

  def index
    @users = User.by_create_at.paginate page: params[:page],
      per_page: Settings.admin_user_perpage
  end

  def edit; end

  def update
    if @user.update_attributes user_params
      flash[:success] = t ".user_updated"
      redirect_to backend_users_path
    else
      flash[:danger] = t ".update_user_fail"
      render :edit
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t ".user_create"
    else
      flash[:danger] = t ".user_create_fail"
    end
    redirect_to backend_users_path
  end

  def show; end

  def destroy
    if @user.destroy
      flash[:success] = t ".user_deleted"
    else
      flash[:danger] = t ".user_delete_fail"
    end
    redirect_to backend_users_path
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation, :address, :phone, :role
  end

  def load_user
    @user = User.find params[:id]
  end

  def load_roles
    @roles = User.roles
  end
end
