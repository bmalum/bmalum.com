class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  private 
  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

<<<<<<< HEAD
  protected  
  def logged_in? 
    unless session[:user_id] 
      flash[:notice] = "You need to log in first." 
      redirect_to  root_url 
=======
  protected 
   
  def logged_in? 
    unless session[:user_id] 
      flash[:notice] = "You need to log in first." 
      redirect_to log_in_path 
>>>>>>> refs/heads/Authentification
      return false 
    else 
      return true 
    end 
  end

<<<<<<< HEAD
=======
 def is_admin? 
    unless current_user.role == "admin" 
      flash[:notice] = "You need to be Admin" 
      redirect_to root_url 
      return false 
    else 
      return true 
    end 
  end
>>>>>>> refs/heads/Authentification

end
