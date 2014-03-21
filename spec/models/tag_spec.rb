require 'spec_helper'

describe Tag do 
  it {should have_many(:tickets).through(:ticket_tags)}
  
end