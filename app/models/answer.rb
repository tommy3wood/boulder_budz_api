class Answer < ApplicationRecord
  belongs_to :answerable, polymorphic: true
  belongs_to :user
  # has_many :votes


  validates :content, presence: true
  validates :content, length: {in: 1..500}

end
