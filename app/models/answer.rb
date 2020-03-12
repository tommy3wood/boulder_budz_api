class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :answerable, polymorphic: true
  has_many :answers, as: :answerable
  has_one_attached :image
 

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
