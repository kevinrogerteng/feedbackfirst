class Ticket < ActiveRecord::Base
  belongs_to :category
  has_many :tags, :through => :tickettags
  belongs_to :subcategory
end
