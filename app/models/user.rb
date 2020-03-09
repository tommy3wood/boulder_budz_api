class User < ApplicationRecord
  has_many :questions
  has_many :answers
  # has_many :votes

  validates :email, presence: true
  # validates :password, presence: true
  # validates :password_confirmation, presence: true
  validates :phone, presence: true
  
end
