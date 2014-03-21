require 'spec_helper'

describe "/" do
  before(:each) do
    @post = Post.create(title: "Sample", description: "this is a description")
    @ticket = []
    @ticket << Ticket.create(user: "user@gmail.com", browser: "Google Chrome")
    @ticket << Ticket.create(user: "another@gmail.com", browser: "Mozilla Firefox")
    @post.tickets << @ticket[0]
    @post.tickets << @ticket[1]
  end
  it "should show main page when signed in"

  describe "/posts.json" do  
    before(:each) do
      get '/posts.json'
      @result = JSON.parse(response.body)
    end
    it "should return all posts made as JSON" do
      @result["posts"].should_not be_nil
      @result["posts"].length.should eq(1)
      @result["posts"].first.tickets.length.should eq(2)
    end
    
    it "should return a post with number of ticket association"
    it "should have a title"
    it "should include the name of a user"

  end
end