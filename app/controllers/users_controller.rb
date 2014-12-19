class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update]
  before_action :require_same_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "You have successfully registered."
      redirect_to root_path
    else
      render 'new'  
    end  
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "You have successfully updated your profile."
      redirect_to root_path
    else
      render 'edit'
    end    
  end

  def show
  end  

  def user_params
    params.require(:user).permit(:username, :password, :time_zone)
  end  

  def set_user
    @user = User.find_by(slug: params[:id])
  end

  def require_same_user
    if current_user != @user
      flash[:error] = "You cannot edit another users profile."
      redirect_to root_path
    end
  end    

end
