class Tag < ActiveRecord::Base
  has_many :tickets, :through => :tickettags
end
