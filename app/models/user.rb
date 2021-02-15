class User < ApplicationRecord
  validates :name, presence: true
  #4 名前の長さに制限を追加する
  validates :name, length: {maximum: 15}
  
  #3 メールアドレスの正規表現を追加してください
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
 
  #1 パスワードの文字数制限を追加する
  VALID_PASWAD_REGEX = /\A[a-zA-Z0-9]+\z/
  validates :password, length: { minimum: 8, maximum: 32 }
  validates :password, presence: true 
  validates :password, format: { with: VALID_PASWAD_REGEX }

  has_secure_password
  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
end