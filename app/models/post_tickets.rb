class PostTickets < ActiveRecord::Base
  belongs_to :post
  belongs_to :ticket
  
end
