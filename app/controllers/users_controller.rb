class UsersController < ApplicationController
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        flash[:success] = 'Welcome!'
        redirect_to root_path
      else
        render 'new'
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :name)
    end

    skip_before_action :require_login
    def activate
      if @user = User.load_from_activation_token(params[:id])
        @user.activate!
        flash[:success] = 'User was successfully activated.'
        redirect_to log_in_path
      else
        flash[:warning] = 'Cannot activate this user.'
        redirect_to root_path
      end
    end
  end