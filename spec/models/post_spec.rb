require 'spec_helper'

describe Post do
  it {should belong_to(:user)}
  it {should have_many(:graphs)}
  it {should have_many(:tickets).through(:post_tickets)}
  it {should validate_presence_of(:title)}
end
