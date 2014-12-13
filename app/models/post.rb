class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :votes, as: :voteable

  validates :title, presence: true, length: {minimum: 5}
  validates :url, presence: true, uniqueness: true
  validates :description, presence: true
  validates :user, presence: true

  def total_votes
    self.up_votes - self.down_votes
  end
  
  def up_votes
    self.votes.where(vote: true).count
  end
  
  def down_votes
    self.votes.where(vote: false).count
  end      
end