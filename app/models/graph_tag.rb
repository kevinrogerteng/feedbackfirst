class GraphTag < ActiveRecord::Base
  belongs_to :tag
  belongs_to :graph
end
