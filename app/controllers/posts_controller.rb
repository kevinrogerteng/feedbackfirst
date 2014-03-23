class PostsController < ApplicationController
  def index
    @posts = Post.includes(:tickets)
    @tickets = Ticket.all
    respond_to do |f|
        f.html  {render :layout => false }
        f.json {render :json => {:posts => @posts.as_json(include: :tickets),
                                :tickets => @tickets.as_json}}
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
    post = Post.find(params[:id])
    respond_to do |f|
        f.html  {render :layout => false }
        f.json  {render :json => post}
    end
  end

  def delete
  end

  private

  def post_params
    params.require(:post).permit(:title, :description)
  end
end
