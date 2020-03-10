class Answer < ApplicationRecord
  belongs_to :answerable, polymorphic: true
  has_many :answers, as: :answerable
  belongs_to :user
  # has_many :votes


  validates :content, presence: true
  validates :content, length: {in: 1..500}

  def parent_route
    route = ""
    if self.answerable_type == "Question"
      route += "/questions/#{self.answerable_id.to_s}"
    else
      route += "/answers/#{self.answerable_id.to_s}"
    end
    route
  end

end
