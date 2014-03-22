require 'spec_helper'

describe "Post" do
  before(:each) do
    @user = User.create(name: "User", email: "sample@gmail.com")
    @post = @user.posts.create(title: "Sample", description: "this is a description")
    @ticket = []
    @ticket << Ticket.create(user: "user@gmail.com", browser: "Google Chrome")
    @ticket << Ticket.create(user: "another@gmail.com", browser: "Mozilla Firefox")
    @post.tickets << @ticket[0]
    @post.tickets << @ticket[1]
  end

  describe "GET JSON with /posts.json ON index method" do  
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
      @result["posts"].should be_kind_of Array
      @result["posts"].first.should be_kind_of Hash
      @result["posts"].length.should eq(1)
    end

    it "should return a post with number of ticket associated" do
      @result["posts"].first['tickets'].length.should eq(2)
    end

    it "should have a title" do 
      @result["posts"].first['title'].should eq(@post.title)
    end

    it "should include the name of a user" do
      @result["posts"].first['user_id'].should eq(@user.id)
    end
  end

  describe "GET JSON with /posts/:id.json on show method" do
    context 'Given a post id' do
      it 'should be successful' do
        get post_path(@post)
        response.status.should == 200
      end
    end
  end

  describe 'POST JSON with /posts.json on create method' do
    context 'Given a post with params' do
      it 'should be successful' do
        post posts_path post: {title: "anotherSample", description: "lalala"}
        response.status.should == 302
      end
    end
  end
end