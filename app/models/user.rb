class User < ApplicationRecord
  has_secure_password
  has_many :questions
  has_many :answers
  has_many :votes
  # has_many :votes

  validates :email, presence: true, uniqueness: true
  validates :phone, phone: true
  
end
