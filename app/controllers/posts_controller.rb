class PostsController < ApplicationController
  before_action :set_post, only: [:show]

  def index
    @posts = Post.includes(:images).all
    # @images = Image.all
  end

  def show
    @images = @post.images.all
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

end
