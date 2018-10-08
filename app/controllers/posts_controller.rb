class PostsController < ApplicationController
  def index
      @post = Post.new
      @image = @post.images.build
  end

def new
    @post = Post.new
    4.times do
      @image = @post.images.build
    end
  end

  def create
    @post = Post.new room_params
    if @post.save
      flash[:success] = t ".create_room_successful"
      redirect_to admin_rooms_path
    else
      flash.now[:warning] = t ".create_room_fail"
      render root_path
    end
  end

  def update
    if @post.update_attributes room_params
      flash[:success] = t ".success"
      redirect_to admin_rooms_path
    else
      render :edit
    end
  end

  def room_params
    params.require(:room).permit :category_id, :label, :floor, :status,
      images_attributes: [:id, :room_id, :image_link]
  end
end
