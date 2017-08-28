class SessionsController < ApplicationController
  def new
    render 'new'
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user
      if @user.password == params[:password]
        login
        redirect_to @question
      else
        @errors = ["Incorrect email/password"]
        render 'new'
      end
    else
      render 'users/new'
    end
  end

  def delete
    logout
    redirect_to @question
  end
end
