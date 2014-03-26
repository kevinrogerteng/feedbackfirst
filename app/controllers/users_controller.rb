class UsersController < ApplicationController

  def create
    @user=User.new(user_params)
    if @user.save
      sign_in @user
    end

    respond_to do |f|
        f.html  {render :layout => false }
        f.json  {render :json => @user}
    end
  end

  def show
    posts = Post.where(user_id: params[:id]).includes(:tickets, :user)
    respond_to do |f|
        f.html {render :layout => false}
        f.json {render :json => posts.as_json(:include=> [:tickets, :graphs, :user])}
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
