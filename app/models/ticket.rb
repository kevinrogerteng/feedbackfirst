class Ticket < ActiveRecord::Base
  belongs_to :category
  belongs_to :subcategory
  has_many :ticket_tags
  has_many :post_tickets
  has_many :posts, through: :post_tickets
  has_many :tags, through: :ticket_tags
end
