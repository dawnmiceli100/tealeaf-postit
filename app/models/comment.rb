class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  has_many :votes, as: :voteable

  validates :body, presence: true

  def total_votes
    up_votes - down_votes
  end
  
  def up_votes
    self.votes.where(vote: true).count
  end
  
  def down_votes
    self.votes.where(vote: false).count
  end      

end  