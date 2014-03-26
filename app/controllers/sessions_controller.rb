class SessionsController < ApplicationController
  include SessionsHelper
  def new
    respond_to do |f|
        f.html {render :layout => false}
        f.json {render :json }
    end
  end

  def create

    user=User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      render :json => user
    else
      render :json => { :error => "Invalid email or password" }
    end
  end

  def delete
    if sign_out
      render :json => { :success => "Successfully signed out"}
    end
  end
end
