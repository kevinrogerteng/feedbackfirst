class Graph < ActiveRecord::Base
  belongs_to :post
  has_many :graph_tags
  has_many :tags, through: :graph_tags

end
