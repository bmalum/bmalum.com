class UsersController < ApplicationController

  def index
    @users = User.search(params[:search])
    respond_to do |format| 
      format.html #index.html.erb
      format.json {render json: @users}
    end
  end

  def show   
    @user = User.find(params[:id]) 
    respond_to do |format| 
      format.html #index.html.erb
      format.json {render json: @user}
    end
  end

  def edit   
    @user = User.find(params[:id]) 
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		redirect_to root_url, :notice => "Signed up!"
  	else
  		redirect_to log_in_path
  	end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params_edit)
      redirect_to @user
    end
  end




  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def user_params_edit
    params.require(:user).permit(:email, :password_hash, :password_salt, :role)
  end
end
