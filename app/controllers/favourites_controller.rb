class FavouritesController < ApplicationController
  before_action :authenticate_user!

  def create
    favourite         = Favourite.new
      post         = Post.find params[:post_id]
    favourite.post = post
    favourite.user    = current_user
    if favourite.save
      redirect_to post_path(post), notice: "Thanks for favouriting!"
    else
      redirect_to post_path(post), alert: "Can't favourite! Have you already favourited?"
    end
  end

  def destroy
    post = Post.find params[:post_id]
    favourite = current_user.favourites.find params[:id]
    favourite.destroy
    redirect_to post, notice: "Favourite removed!"
  end

  def index
    @favourites = current_user.favourites.all
  end
end
