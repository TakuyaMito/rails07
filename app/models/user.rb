class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 15}
  validates :email,presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  has_secure_password
  validates :password,format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}\z/i }

  has_many :topics
  has_many :favorites, dependent: :destroy
  has_many :favorite_topics, through: :favorites, source: 'topic'
  has_many :comments
  has_many :comment_topics, through: :comments, source: 'topic'

end
