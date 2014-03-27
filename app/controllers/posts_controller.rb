class PostsController < ApplicationController
  def index
    @posts = Post.includes(:tickets, :user)
    respond_to do |f|
        f.html  {render :layout => false }
        f.json {render :json => @posts.as_json(:include=> [:tickets, :user])}
    end
  end

  def new
    respond_to do |f|
        f.html {render :layout => false}
        f.json {render :json }
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
    update_post = Post.find(params[:id])
    update_post.update_attributes(post_params)
    respond_to do |f|
        f.html {redirect_to posts_path}
        f.json {render json: update_post }
    end
  end

  def show
    post = Post.where(id: params[:id]).includes(graph: [:tags], tickets: [:tags])
    
    respond_to do |f|
        f.html  {render :layout => false }
        f.json  {render :json => post.as_json(:include => [:tickets, :graph => {:include => [:tags => {only: :name, :include => :tickets}]}])}
    end
  end

  def delete
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :user_id, :graphs => [:id, :name])
  end

end
