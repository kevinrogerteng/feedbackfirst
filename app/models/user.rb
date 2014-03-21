class User < ActiveRecord::Base
  has_many :posts
  validates_uniqueness_of :email
end
