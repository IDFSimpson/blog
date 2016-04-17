class Comment < ActiveRecord::Base
  belongs_to :customer
  belongs_to :post

  validates :body, presence: :true
end
