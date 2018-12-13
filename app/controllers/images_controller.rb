class ImagesController < ApplicationController
  def new
  end

  def destroy
    @image = Image.find(params[:id])
    post = @image.post
    @image.destroy
    respond_to do |format|
      format.html {redirect_to post_url(post), notice: 'post photo was successfully destroyed.'}
    end
  end
end
