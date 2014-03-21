require 'spec_helper'

describe Category do
  it { should have_many(:subcategories)}
  it { should have_many(:tickets)}

end