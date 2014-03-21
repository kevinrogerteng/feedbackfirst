require 'spec_helper'

describe Ticket do 
  it {should belong_to(:category)}
  it {should belong_to(:subcategory)}
  it {should have_many(:tags).through(:ticket_tags)}
  it 'can be associated to two tags' do
    ticket = Ticket.create
    tag1 = ticket.tags.create(name: "tag1")
    tag2 = ticket.tags.create(name: "tag2")
    ticket.tags.should eq([tag1, tag2])
  end
end