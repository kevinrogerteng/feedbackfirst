require 'spec_helper'

describe Graph do
  it {should belong_to(:post)}
  it {should have_many(:graph_tags)}
  it {should have_many(:tags).through(:graph_tags)}
end
