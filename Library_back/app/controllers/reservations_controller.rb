class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  # GET /reservations
  # GET /reservations.json
  def index
    current_user
    if logged_in?
       if @current_user.admin
       	    @reservations = Reservation.all
       	    if @reservations.nil?
       	           flash[:error] = "No booking history."
       	           redirect_to login_path
       	    end       
       else
       	    @reservations = Reservation.where(email: @current_user.email)
       	    
       	    if @reservations.nil?
       	    	flash[:error] = "No booking history."
		redirect_to login_path
       	    end
       end
   end    	    	    
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations
  # POST /reservations.json
  def create
    current_user
    @reservation = Reservation.new(reservation_params)
    @rooms = Room.all
    @room_details = @rooms.find_by(room_name: @reservation.room_name)
    @reservation.size = @room_details.size
    @reservation.library = @room_details.library
    if !@current_user.admin
    	@reservation.email = @current_user.email
    end	
    @reservation.booked = "#{@reservation.slot}:00 - #{@reservation.slot+2}:00"
    respond_to do |format|
      if @reservation.save
        format.html { redirect_to @reservation, notice: 'Reservation was successfully created.' }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      if @current_user.admin
      	params.require(:reservation).permit(:email,:room_name, :date, :slot)
      else
      	params.require(:reservation).permit(:room_name, :date, :slot)
      end	
    end
end
