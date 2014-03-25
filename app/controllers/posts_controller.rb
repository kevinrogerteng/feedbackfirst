class PostsController < ApplicationController
  def index
    @posts = Post.includes(:tickets, :user)
    respond_to do |f|
        f.html  {render :layout => false }
        f.json {render :json => @posts.as_json(:include=> [:tickets, :user])}
    end
  end

  def create
    new_post = Post.create(post_params)
    respond_to do |f|
        f.html {redirect_to posts_path}
        f.json {render json: new_post }
    end
  end

  def update
  end

  def show
    post = Post.where(id: params[:id]).includes(:graphs, tickets: [:tags])
    # post = Post.includes(:tickets => :tags).includes(:graphs).find(params[:id])
    respond_to do |f|
        f.html  {render :layout => false }
        f.json  {render :json => post.as_json(:include => [:graphs, :tickets => {:include => [:tags => {:only => :name}]}])}
    end
  end

  def delete
  end

  private

  def post_params
    params.require(:post).permit(:title, :description)
  end
end
