class UsersController < ApplicationController

def show
@users=User.find(params[:id])
@articles=@users.articles
end


  def new
    @user=User.new
  end

  def index
@users=User.all
  end

  def create
    @user=User.create(user_params)
    if @user.save
      session[:user_id]=@user.id
      flash[:notice]="welcome to Alphablog you have succesfully signed up"
      redirect_to @user.articles
    else
      render 'new'
    end
  end

  def edit
      @user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
    if @user.update(user_params)
        flash[:notice]="User updated succesfully"
      redirect_to

    else
      render 'edit'
    end

  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

end
