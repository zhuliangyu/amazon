class SessionsController < ApplicationController
  def new

  end

  def create

    user=User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id]=user.id
      redirect_to home_path,notice: "you have sign in"
    else
      flash.now[:alert]="wrong password"
      render :new
    end


  end

  def destroy
    session[:user_id]=nil
    redirect_to home_path,notice: "sign out"

  end


end
