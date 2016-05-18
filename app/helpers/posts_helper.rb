module PostsHelper
  def user_favourite
    @user_favourite ||= @post.favourite_for(current_user)
  end
end
