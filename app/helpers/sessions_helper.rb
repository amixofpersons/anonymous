module SessionsHelper
  def authenticate(user)
    user.authenticate(params[:session][:password])
  end
end
