class CommentsController < ApplicationController

  before_action(:find_comment, {only: [:show, :edit, :update, :destroy]})

  def index
    @comments = comment.all
  end

  def new
    @comment = comment.new
  end

  def create
    @comment = comment.create{comment_params}
    if @comment.save
      flash[:notice] = "Comment Created"
      redirect_to comment_path(comment_params)
    else
      flash[:alert] = "Error! Comment not created"
      render :new
    end
  end

  def edit
  end

  def update
    if @comment.update comment_params
      redirect_to comment_path(@comment), notice: "Comment updated!"
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @comment.destroy
    redirect_to comments_path, notice: "Your comment was deleted."
  end


  private

  def find_comment
     @comment = comment.find params[:id]
  end

  def comment_params
    params.require(:comment).permit([:title, :body])
  end

end
