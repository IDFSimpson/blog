class PostsController < ApplicationController

   before_action(:find_post, {only: [:show, :edit, :update, :destroy]})


  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create{post_params}
    if @post.save
      flash[:notice] = "Post Created"
      redirect_to post_path(post_params)
    else
      flash[:alert] = "Error! Post not created"
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update post_params
      redirect_to post_path(@post), notice: "Question updated!"
    else
      render :edit
    end
  end

  def show 
  end

  def find_post
     @post = Post.find params[:id]
  end

  def post_params
    params.require(:post).permit([:title, :body])
  end
end
