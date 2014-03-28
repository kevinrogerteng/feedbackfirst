require 'spec_helper'

describe "Post" do
  before(:each) do
    @user = User.create(name: "User", email: "sample@gmail.com", password: "123456", password_confirmation:"123456")
    @post = Post.create(title: "Sample", description: "this is a description", user_id: @user.id)
    @ticket = []
    @ticket << Ticket.create(user: "user@gmail.com", browser: "Google Chrome")
    @ticket << Ticket.create(user: "another@gmail.com", browser: "Mozilla Firefox")
    @post.tickets << @ticket[0]
    @post.tickets << @ticket[1]
    @post.graphs.create(name: "sampleGraph")
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
      @result.should_not be_nil
      @result.should be_kind_of Array
      @result.length.should eq(1)
    end

    it "should return a post with number of ticket associated" do
      @result.first['tickets'].length.should eq(2)
    end

    it "should have a title" do 
      @result.first['title'].should eq(@post.title)
    end

    it "should include the name of a user" do
      user = @result.first['user']
      user['name'].should eq(@user.name)
    end
  end

  describe "GET JSON with /posts/:id.json on show method" do
    context 'Given a post id' do
      it 'should be successful' do
        get post_path(@post)
        response.status.should == 200
      end

      it 'should have post including tickets' do
        json = { :format => 'json'}
        get post_path(@post), json
        result = JSON.parse(response.body)
        first_ticket = result.first["tickets"].first
        first_ticket['user'].should eq(@post.tickets.first.user) 
      end
      it 'should have post including graphs' do
        json = { :format => 'json'}
        get post_path(@post), json
        result = JSON.parse(response.body)
        first_graph = result.first["graphs"].first
        first_graph["name"].should eq(@post.graphs.first.name)
      end
    end
  end

  describe 'POST JSON with /posts.json on create method' do
    context 'Given a post with params' do
      it 'should be successful' do
        post posts_path post: {title: "anotherSample", description: "lalala", user_id: 1}
        response.status.should == 302
      end
    end
  end
end