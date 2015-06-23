class SessionsController < ApplicationController
  def new
  end

  def create
    if user User.find_by(name: params[:name]) && user.authenticate(params[:password])
      # If the user exists AND the password entered is correct.
      # Save the user id inside a browser cookie.
      # Specifically, the rails 'session'. This is how we keep the user
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to root_url, notice: 'successfully logged in'
    elsif user
      # If user's login doesn't work, send them back to the login form.
      flash[:alert] = 'incorrect password'
      render :new
    else
      flash[:alert] = 'username or email does not exist'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'successfully logged out'
  end
end
