class SessionsController < ApplicationController
  def new
    render 'new'
  end

  def create
    @user = User.authenticate(params[:email], params[:password])
    if @user
      login
      redirect_to @question
    else
      @errors = ["Incorrect email/password"]
      render 'new'
    end
  end

  def delete
    logout
    redirect_to @question
  end
end
