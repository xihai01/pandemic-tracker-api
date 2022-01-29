class Admin::SessionsController < ApplicationController
  #/login endpoint creates a session and redirects to user controller for data
  def create
    # If the user exists AND the password entered is correct.
    if admin = Admin.authenticate_with_credentials(params[:email], params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:user_id] = admin.id
      
      render json: { message: "User authorization successful" }, status: 200

    else
    # If user's login doesn't work, send them back to the login form.
      render json: { message: "Bad credentials" }, status: :unauthorized
    end
  end

  def destroy
    session[:user_id] = nil
    render json: { message: "Logged out successfully" }
  end

end
