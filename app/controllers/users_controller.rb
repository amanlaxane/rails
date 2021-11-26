class UsersController < ApplicationController
  def new
    @user=User.new
  end

  def create
    @user=User.create(user_params)
    if @user.save
      flash[:notice]="welcome to Alphablog you have succesfully signed up"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

end
