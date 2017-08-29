class SessionsController < ApplicationController

  def new
    render 'new'
  end

  def create
    @user = User.find_by(email: session_params["email"])
    if @user && @user.authenticate(session_params["password"])
      login
      redirect_to questions_path
    else
      @errors = ["wrong email or password"]
      render 'new'
    end
  end

  def delete
    logout
    redirect_to questions_path
  end

  private
    def session_params
      params.require(:user).permit(:email, :password)
    end
end
