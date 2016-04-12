class Post < ActiveRecord::Base
  # title should be required & unique
  validates :title, presence: true, uniqueness: true
  has_many :comments, dependent: :destroy
end
