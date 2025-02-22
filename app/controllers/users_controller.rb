class UsersController < ApplicationController

    def new
      @user = User.new
    end
  
    def show
      if logged_in?
          @user = User.find_by(id: params[:id])
      else
          redirect_to root_path
      end
    end
  
    def create
      @user = User.new(user_params)
  
      if @user.save
        session[:user_id] = @user.id
        redirect_to @user
      else
        render :new
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:name, :password, :happiness, :nausea, :height, :tickets, :admin)
    end
  
  end 