
FactoryGirl.define do
  factory :category do
    name
  end

  factory :subcategory do
    name
    category_id 1
  end

  factory :ticket do
    user
    ticket_tag_id 1
  end

  factory :tag do
    name
    ticket_tag_id 1
  end

  factory :ticket_tag do
    ticket_id 1
    tag_id 1
  end  
end