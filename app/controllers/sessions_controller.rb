class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    if user && user.authenticate(params[:session][:user_password])
      login(user)
      redirect_to root_path
    else
      flash[:error] = "Invalid Login."
      redirect_to login_path
    end
  end

  def destroy
    logout
    redirect_to :back
  end

  private
  def user_params
    params.require(:user).permit(:name,:password)
  end
end
