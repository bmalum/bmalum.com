class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.authenticate()
  	if user 
  	session[:user_id] = user.user_id
  	redirect_to  root_url, :notice  => "Logged in!"
  	else
  		falsh.now.alert = "Invalid email or password"
  		render "new"
  	end
  end
end
