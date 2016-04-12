class BlogPostsController < ApplicationController
  def index
    @posts = Post.all
  end
end
