class User < ActiveRecord::Base
  has_secure_password

  validates :name, :email, presence: true
  validates :name, :email, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

  has_many :comments
  has_many :posts
  has_many :votes


end
