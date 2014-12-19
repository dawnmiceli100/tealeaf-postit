class Comment < ActiveRecord::Base
  # include Voteable module
  include VoteableDmm

  belongs_to :user
  belongs_to :post

  validates :body, presence: true

end  