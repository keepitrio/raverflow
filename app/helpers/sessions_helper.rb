module SessionsHelper
  def current_user
    @user ||= User.find(session[:id]) if session[:id]
  end

  def logged_in?
    !!current_user
  end

  def login
    session[:id] = @user.id
  end

  def logout
    session[:id] = nil
  end
end
