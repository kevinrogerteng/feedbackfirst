class Ticket < ActiveRecord::Base
  belongs_to :category
  belongs_to :subcategory
  has_many :ticket_tags
  has_many :tags, through: :ticket_tags
end
