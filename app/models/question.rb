class Question < ApplicationRecord
  has_many :answers, as: :answerable
  belongs_to :user

  enum category: {advice: 0, beta_room: 1, gear_room: 2, app_feedback: 3}

  validates :category, presence: true
  validates :title, presence: true
  validates :content, presence: true

  def op_email
    emails = []
    self.answers.each do |answer|
      emails << answer.user.email
    end
    emails
  end

end
