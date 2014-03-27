namespace :db do    
  desc "Delete and Add New Tickets"
  task :populate => :environment do

  make_categories
  make_tags
  make_posts
  make_user
  categories = Category.all
  tags = Tag.all
  posts = Post.all
  users = User.all


    Ticket.populate 100 do |ticket|
      ticket.name = Faker::Name.name
      ticket.user = Faker::Internet.safe_email
      ticket.content = Faker::Lorem.paragraph(2)
      ticket.browser = ["Mozilla", "Google Chrome", "Internet Explorer", "Opera"]
      ticket.category_id = categories.sample.id
      subcategories = Category.find(ticket.category_id).subcategories
      ticket.subcategory_id = subcategories.sample.id
    end

  seed_tickets = Ticket.all

    seed_tickets.each do |ticket|
      4.times do |y|
        ticket.tags << tags.sample
      end
    end
    posts.each do |post|
      rand(100).times do |y|
        post.tickets << seed_tickets.sample
      end
      users.sample.posts << post
    end
  end

end

def make_posts
  Post.populate 10 do |post|
    post.title = Faker::Lorem.words
    post.description = "Bacon ipsum dolor sit amet jowl drumstick landjaeger fatback pork belly turkey. Chicken turkey doner andouille prosciutto tenderloin ham. Pancetta chuck turkey filet mignon, kielbasa andouille short ribs beef doner shankle pork belly tri-tip. Ball tip sausage brisket, kielbasa short ribs shoulder hamburger meatball andouille. Turkey pork turducken biltong fatback jerky ribeye. Filet mignon brisket shankle meatball pancetta. Meatball short loin pork belly pig.

Sirloin shankle cow jowl short loin frankfurter strip steak meatball. Doner kevin short ribs, rump ribeye jerky jowl sausage brisket pork andouille. Cow jowl ground round porchetta fatback tongue, pancetta drumstick turkey short loin shankle. Pork belly andouille short loin ribeye."
  end
end

def make_user
  User.populate 5 do |user|
    user.name = Faker::Name.name
    user.email = Faker::Internet.safe_email
  end
end

def make_categories
    categories = []
    categories << Category.create(name: "Accounts")
    categories << Category.create(name: "Payments")
    categories << Category.create(name: "Shipping")
    categories << Category.create(name: "Cart")
    categories << Category.create(name: "Feedback/Suggestions")

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
  tags << Tag.create(name: "happy")
  tags << Tag.create(name: "accounts")
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
  tags << Tag.create(name: "bad_payments")
  tags << Tag.create(name: "suggestion")
  tags << Tag.create(name: "shipment")
  tags << Tag.create(name: "wrong_item_shipment")
  tags << Tag.create(name: "slow_shipping")

end