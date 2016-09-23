class SessionsController < ApplicationController
  def new
	current_user
	if logged_in?
		redirect_to user
	end		
  end
  
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
    	log_in user
    	redirect_to user
    else
    	flash[:error] = "The email address or the password is not correct."
    	redirect_to login_path	
  end
end  
  def destroy
     log_out
     redirect_to root_url
  end
end
