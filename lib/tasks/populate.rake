namespace :db do    
  desc "Delete and Add New Tickets"
  task :populate => :environment do
  Ticket.each(&:delete_all)

    make_categories
    make_tags
    make_subcategories

  Ticket.populate 10 do |ticket|
    ticket.user = Faker::internet.safe_email
    ticket.content = Faker::Lorem.paragraph(2)
    ticket.browser = ["Mozilla", "Google Chrome", "Internet Explorer", "Opera"]
    ticket.category_id = [1..5]
    ticket.subcategory_id = [1..16]
  end
end

def make_categories
    categories = []
    categories << Category.create(name: "Accounts")
    categories << Category.create(name: "Payments")
    categories << Category.create(name: "Shipping")
    categories << Category.create(name: "Cart")
    categories << Category.create(name: "Feedback/Suggestions")
end


def make_subcategories
  subcategories = []

  subcategories << Subcategory.create(name: "sign_in")
  subcategories << Subcategory.create(name: "sign_up")
  subcategories << Subcategory.create(name: "password_reset")
  subcategories << Subcategory.create(name: "mailing_list")

  subcategories << Subcategory.create(name: "credit_card")
  subcategories << Subcategory.create(name: "unable_to_pay")
  subcategories << Subcategory.create(name: "payment_method")
  subcategories << Subcategory.create(name: "mis_charge")

  subcategories << Subcategory.create(name: "shipping_time_slow")
  subcategories << Subcategory.create(name: "item_not_received")
  subcategories << Subcategory.create(name: "wrong_item_shipment")
  subcategories << Subcategory.create(name: "inaccurate_timeline")

  subcategories << Subcategory.create(name: "add_cart")
  subcategories << Subcategory.create(name: "edit_cart")
  subcategories << Subcategory.create(name: "delete_cart")

  subcategories << Subcategory.create(name: "Feedback/Suggestions")

  categories[0].subcategories << subcategories[0]
  categories[0].subcategories << subcategories[1]
  categories[0].subcategories << subcategories[2]
  categories[0].subcategories << subcategories[3]

  categories[1].subcategories << subcategories[4]
  categories[1].subcategories << subcategories[5]
  categories[1].subcategories << subcategories[6]
  categories[1].subcategories << subcategories[7]

  categories[2].subcategories << subcategories[8]
  categories[2].subcategories << subcategories[9]
  categories[2].subcategories << subcategories[10]
  categories[2].subcategories << subcategories[11]

  categories[3].subcategories << subcategories[12]
  categories[3].subcategories << subcategories[13]
  categories[3].subcategories << subcategories[14]

  categories[4].subcategories << subcategories[15]

end

def make_tags

  tags = []

  tags << Tag.create(name: "angry")
  tags << Tag.create(name: "UI")
  tags << Tag.create(name: "sign_in")
  tags << Tag.create(name: "password")
  tags << Tag.create(name: "password_reset")
  tags << Tag.create(name: "payment")
  tags << Tag.create(name: "payment_fail")
  tags << Tag.create(name: "mis_charge")
  tags << Tag.create(name: "cart")
  tags << Tag.create(name: "cart_add")
  tags << Tag.create(name: "cart_edit")
  tags << Tag.create(name: "cart_delete")
  tags << Tag.create(name: "payment_processor")
  tags << Tag.create(name: "suggestion")
  tags << Tag.create(name: "shipment")
  tags << Tag.create(name: "wrong_item_shipment")
  tags << Tag.create(name: "slow_shipping")
  
end