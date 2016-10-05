class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    current_user
    if logged_in?
    
    	#byebug
    	if @current_user.admin
    		@users = User.all
    		#byebug
    	else	
		#byebug    	
    		@user = current_user
    		redirect_to login_path
    	end
    else
    	
        redirect_to login_path
    end    
  end

  # GET /users/1
  # GET /users/1.json
  def show
    
    @user = User.find(params[:id])
   
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end
  
  # POST /users
  # POST /users.json
  def create
    current_user
    if logged_in?    
    	@user = User.new(user_params)
    	@adminator = params[:user][:admin]
    	if @adminator
    		@user.admin = true
    	else
    		@user.admin = false
	end    	
    	#current_user
    	#byebug
    	respond_to do |format|
    	  if @user.save
    	    
    	    format.html { redirect_to users_path, notice: 'User was successfully created.' }
    	    format.json { render :show, status: :created, location: @user }
    	  else
    	    format.html { render :new }
    	    format.json { render json: @user.errors, status: :unprocessable_entity }
    	  end
    	end
    
    else
    	@user = User.new(user_params)
    	@user.admin = false
    	#current_user
    	respond_to do |format|
    	  if @user.save
    	    log_in @user
    	    format.html { redirect_to @user, notice: 'User was successfully created.' }
    	    format.json { render :show, status: :created, location: @user }
    	  else
    	    format.html { render :new }
    	    format.json { render json: @user.errors, status: :unprocessable_entity }
    	  end
    	end  
     end	
    	
end
 
  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Welcome #{@user.name}!' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    current_user
    if !@user.admin
    @user.destroy
    @reservations = Reservation.where(email: @user.email)
    @reservations.each {|x| x.destroy}
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
    else
    	flash[:error] = "Cant Delete an Admin!"
    	redirect_to users_path
    end
    
  end
  
    
  
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
