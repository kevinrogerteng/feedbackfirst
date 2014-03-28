require 'spec_helper'

describe Tag do 
  it {should have_many(:graph_tags)}
  it {should have_many(:ticket_tags)}
  it {should have_many(:tickets).through(:ticket_tags)}
  it {should have_many(:graphs).through(:graph_tags)}
end