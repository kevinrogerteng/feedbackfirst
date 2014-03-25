class SessionsController < ApplicationController
  def new
    respond_to do |f|
        f.html {render :layout => false}
        f.json {render :json }
    end
  end

  def create

    user=User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      render :json => user
    else
      render :json => { :error => "Invalid email or password" }
    end
  end

  def delete
    cookies.delete(:remember_token)
    respond_to do |f|
        f.html {redirect_to posts_path}
        f.json {render :json}
    end
  end
end
