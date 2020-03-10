class Question < ApplicationRecord
  has_many :answers, as: :answerable
  belongs_to :user

  enum category: {advice: 0, beta_room: 1, gear_room: 2, app_feedback: 3}

  validates :category, presence: true
  validates :title, presence: true
  validates :content, presence: true

end
