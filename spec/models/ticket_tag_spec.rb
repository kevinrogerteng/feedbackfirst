require 'spec_helper'

describe TicketTag do
  it {should belong_to(:ticket)}
  it {should belong_to(:tag)}
end
