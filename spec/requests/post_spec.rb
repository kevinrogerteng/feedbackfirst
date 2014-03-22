require 'spec_helper'

describe "/" do
  before(:each) do
    @post = Post.create(title: "Sample", description: "this is a description")
    @user = User.create(name: "User", email: "sample@gmail.com")
    @ticket = []
    @ticket << Ticket.create(user: "user@gmail.com", browser: "Google Chrome")
    @ticket << Ticket.create(user: "another@gmail.com", browser: "Mozilla Firefox")
    @post.tickets << @ticket[0]
    @post.tickets << @ticket[1]
  end

  describe "GET JSON with /posts.json ON Index method" do  
    before(:each) do
      get '/posts.json'
      @result = JSON.parse(response.body)
    end

    it "should be successful" do 
      get posts_path
      response.status.should == 200
    end

    it "should return all posts made as JSON" do
      @result["posts"].should_not be_nil
      @result["posts"].should_be_kind_of Hash
      @result["posts"].length.should eq(1)
    end

    it "should return a post with number of ticket association" do
      @result["posts"].first['tickets'].length.should eq(2)
    end

    it "should have a title" do 
      @result["posts"].first['title'].should eq(@post.title)
    end

    it "should include the name of a user"

  end
end