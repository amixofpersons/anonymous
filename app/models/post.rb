class Post < ActiveRecord::Base
  belongs_to :poster, class_name: "User", foreign_key: "user_id"

  has_many :comments
  has_many :votes, as: :votable

  validates :user_id, :title, :body, presence: true

  def number_of_votes
    self.votes.size
  end
end
