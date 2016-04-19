class Comment < ActiveRecord::Base
  belongs_to :customer
  belongs_to :post
  belongs_to :user

  validates :body, presence: :true
end
