class PostsController < ApplicationController
  def index
    posts = Post.all
    respond_to do |f|
        f.html  {render :layout => false }
        f.json  {render :json => {"posts" => posts.as_json}}
    end
  end

  def create
  end

  def update
  end

  def show
  end

  def delete
  end
end
