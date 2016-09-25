class SessionsController < ApplicationController
  def new
        
	current_user
	if logged_in?
		redirect_to @current_user
	end		
  end
  
  def create
    user = User.find_by(email: params[:session][:email])
    @admin_validate = params[:session][:radio]
    if !@admin_validate
        
        if user && user.authenticate(params[:session][:password])
    		log_in user
    		redirect_to user
    	else
    		flash[:error] = "The email address or the password is not correct."
    		redirect_to login_path	

        end
    else    
    	if user.admin
    	
    		if user && user.authenticate(params[:session][:password])
    			log_in user
    			redirect_to user
    		else
    			flash[:error] = "The email address or the password is not correct."
    			redirect_to login_path	
 		end
 	
 	else
 		flash[:error] = "Permission Denied! Only for Administrators."
        	redirect_to login_path
 	
 	end	
    end
end  

  def destroy
     log_out
     redirect_to root_url
  end
end
