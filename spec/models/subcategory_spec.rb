require 'spec_helper'

describe Subcategory do 
  it { should belong_to(:category)}
  it { should have_many(:tickets)}

end