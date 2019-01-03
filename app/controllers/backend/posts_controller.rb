class Backend::PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
    # @images = Image.all
  end

  # def show
  #   @images = @post.images.all
  # end

  def new
    @post = Post.new
    @image = @post.images.build
  end

  def edit
  end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        params[:images]['photo'].each do |a|
          @image = @post.images.create!(:photo => a)
        end
        format.html { redirect_to backend_posts_path, notice: 'post was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        params[:images]['photo'].each do |a|
          @image = @post.images.create!(:photo => a)
        end
        format.html { redirect_to backend_posts_path, notice: 'post was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to backend_posts_path, notice: 'post was successfully destroyed.' }
    end
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description, images_attributes: [:id, :post_id, :product_id, :photo , :description])
  end
end
