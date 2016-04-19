class Post < ActiveRecord::Base
  # title should be required & unique
  validates :title, presence: true, uniqueness: true, length: {minimum: 7}
  validates :body,  presence: true

  has_many   :comments, dependent: :destroy
  belongs_to :category
  belongs_to :user


  def body_snippet
    body.length > 99 ? "#{self.body[0...99]}..." : body
  end

  def category_or_unknown
    category ? category.title : "Unknown Category"
  end

end
