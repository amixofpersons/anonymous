class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    user = User.find_by(email: params[:session][:email])

    if authenticate?
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, :notice => 'Logged Out!'
  end

  private

    def authenticate?
      if user && user.authenticate(params[:session][:password])
      end
    end

end
