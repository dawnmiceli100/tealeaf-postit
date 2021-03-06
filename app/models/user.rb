class User < ActiveRecord::Base
  # modules to include
  include Sluggable

  has_many :posts
  has_many :comments
  has_many :votes

  has_secure_password validations: false

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create, length: {minimum: 3}

  sluggable_column :username

  def admin?
    self.role.to_s == "admin"
  end  
end