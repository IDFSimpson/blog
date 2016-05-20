class FavouritesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only: [:create, :destroy]

  def create
    favourite      = Favourite.new
    favourite.post = @post
    favourite.user = current_user
    respond_to do |format|
      if favourite.save
        format.html { redirect_to post_path(@post), notice: "Thanks for favouriting!" }
        format.js   { render :modify_favourite }
      else
        format.html { redirect_to post_path(@post), alert: "Can't favourite! Have you already favourited?" }
        format.js   { render :modify_favourite }
      end
    end
  end

  def destroy
    favourite = current_user.favourites.find params[:id]
    favourite.destroy
    respond_to do |format|
      format.html { redirect_to post_path(@post), notice: "Favourite removed!" }
      format.js   { render :modify_favourite }
    end
  end

  def index
    @favourites = current_user.favourites.all
  end


  private

  def find_post
    @post ||= Post.find params[:post_id]
  end

end
