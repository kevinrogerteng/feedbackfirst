require 'spec_helper'

describe Ticket do 
  it {should belong_to(:category)}
  it {should belong_to(:subcategory)}
  it {should have_many(:tags).through(:ticket_tags)}

end