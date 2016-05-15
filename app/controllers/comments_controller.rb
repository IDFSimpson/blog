class CommentsController < ApplicationController

  before_action :authenticate_user!
  before_action(:find_comment, {only: [:show, :edit, :update, :destroy]})
  before_action :authorize_comment, only: [:edit, :update, :destroy]


  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find params[:post_id]
    @comment = Comment.new(comment_params)
    @comment.post = @post
    if @comment.save
      flash[:notice] = "Comment Created"
      redirect_to post_path(@post)
    else
      flash[:alert] = "Error! Comment not created"
      render "/posts/show"
    end
  end

  def edit
  end

  # def update
  #   if @comment.update comment_params
  #     redirect_to comment_path(@comment), notice: "Comment updated!"
  #   else
  #     render :edit
  #   end
  # end

  def show
  end

  def destroy
    @post = Post.find params[:post_id]
    @comment.destroy
    redirect_to post_path(@post), notice: "Your comment was deleted."
  end


  private

  def find_comment
     @comment = Comment.find params[:id]
  end

  def authorize_comment
    flash[:alert] = "You do not have permission to manage this comment"
    redirect_to root_path unless can? :manage, @comment
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

end
