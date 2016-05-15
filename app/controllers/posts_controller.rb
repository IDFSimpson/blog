class PostsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action(:find_post, {only: [:show, :edit, :update, :destroy]})
  before_action :authorize_post, only: [:edit, :update, :destroy]



  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      flash[:notice] = "Post Created"
      redirect_to post_path(@post)
    else
      flash[:alert] = "Error! Post not created"
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update post_params
      redirect_to post_path(@post), notice: "Blog Post updated!"
    else
      render :edit
    end
  end

  def show
    @comment = Comment.new
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "The blog post #{@post.title} was deleted."
  end

  private

  def authorize_post
    flash[:alert] ="You do not have permission to delete the blog post #{@post.title}"
    redirect_to root_path unless can? :manage, @post
  end

  def find_post
     @post = Post.find params[:id]
  end

  def post_params
    params.require(:post).permit([:title, :body, :category_id])
  end
end
