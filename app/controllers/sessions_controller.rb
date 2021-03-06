class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.authenticate(params[:email], params[:password])
  	if user 
  	session[:user_id] = user._id.to_s
  	redirect_to  static_pages_home_path , :notice  => "Logged in! Your User-ID is: #{session[:user_id]}"
  	else
  		flash.now.alert = "Invalid email or password"
  		render "new"
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_url, :notice => "Logged out!"
  end
end
