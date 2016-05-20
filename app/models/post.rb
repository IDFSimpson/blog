class Post < ActiveRecord::Base
  # title should be required & unique
  validates :title, presence: true, uniqueness: true, length: {minimum: 7}
  validates :body,  presence: true

  has_many   :comments, dependent: :nullify
  belongs_to :category
  belongs_to :user

  has_many    :favourites, dependent: :nullify
  has_many    :favouriting_users, through: :favourites, source: :users

  def body_snippet
    body.length > 99 ? "#{self.body[0...99]}..." : body
  end

  def category_or_unknown
    category ? category.title : "Unknown Category"
  end

  def favourite_for(user)
    favourites.find_by_user_id user if user
  end

  def favourited_by?(user)
    favourites.find_by_user_id(user.id).present?
  end

end
