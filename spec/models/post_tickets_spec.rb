require 'spec_helper'

describe PostTicket do
  it {should belong_to(:post)}
  it {should belong_to(:ticket)}

end
