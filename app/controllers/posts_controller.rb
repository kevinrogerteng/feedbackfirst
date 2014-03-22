class PostsController < ApplicationController
  def index
    posts = Post.includes(:tickets)
    respond_to do |f|
        f.html  {render :layout => false }
        f.json  {render :json => {"posts" => posts.as_json(include: :tickets)}}
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
