class AttachCommentsToPosts < ActiveRecord::Migration
  def change
    add_reference :comments, :post
  end
end
