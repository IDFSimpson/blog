class FavouritesController < ApplicationController
  before_action :authenticate_user!

  def create
    favourite      = Favourite.new
    post           = Post.find params[:post_id]
    favourite.post = post
    favourite.user = current_user
    respond_to do |format|
      if favourite.save
        format.html { redirect_to post_path(post), notice: "Thanks for favouriting!" }
        format.js   { render :modify_favourite }
      else
        format.html { redirect_to post_path(post), alert: "Can't favourite! Have you already favourited?" }
        format.js   { render :modify_favourite }
      end
    end
  end

  def destroy
    post = Post.find params[:post_id]
    favourite = current_user.favourites.find params[:id]
    favourite.destroy
    respond_to do |format|
      format.html { redirect_to post_path(post), notice: "Favourite removed!" }
      format.js   { render :modify_favourite }
    end
  end

  def index
    @favourites = current_user.favourites.all
  end

end
