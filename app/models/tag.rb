class Tag < ActiveRecord::Base

  has_many :ticket_tags
  has_many :tickets, through: :ticket_tags
  has_many :graphs, through: :graph_tags
  has_many :graph_tags
end
