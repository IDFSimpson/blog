class User < ActiveRecord::Base
  has_many :posts
  has_many :comments

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: VALID_EMAIL_REGEX

  validates :password, presence: true

  has_many :favourites, dependent: :destroy
  has_many :favourite_posts, through: :favourites, source: :post
end
