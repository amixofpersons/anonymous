class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    user = User.find_by(name: params[:session][:user_name])

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
    redirect_to root_path, :notice => 'Logged Out!'
  end

end
