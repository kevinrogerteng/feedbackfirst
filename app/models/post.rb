class Post < ActiveRecord::Base
    belongs_to :user
    has_many :graphs
    has_many :post_tickets
    has_many :tickets, through: :post_tickets
    validates_presence_of :title
end
