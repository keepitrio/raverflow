class SessionsController < ApplicationController

  def new
    render 'new'
  end

  def create
    @user = User.find_by(email: session_params["email"])
    @user.authenticate(session_params["password"])
    if @user
      login
      redirect_to questions_path
    else
      @errors = ["Incorrect email/password"]
      render 'new'
    end
  end

  def delete
    logout
    redirect_to @question
  end

  private
    def session_params
      params.require(:user).permit(:email, :password)
    end
end
