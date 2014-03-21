require 'spec_helper'

describe PostTickets do
  it {should belong_to(:post)}
  it {should belong_to(:ticket)}

end
