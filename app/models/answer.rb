class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :answerable, polymorphic: true
  has_many :answers, as: :answerable
  has_many :votes
  has_one_attached :image
  # default_scope { order("vote_count DESC") }

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

  def vote_count
    count = self.votes.where(:positive => true).count - self.votes.where(:positive => false).count
    count
  end

end
