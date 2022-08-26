class BookingsController < ApplicationController
  # def new
  #   @booking = Booking.new
  #   @movable = Movable.find(params[:id])
  #   authorize @booking
  # end

  def index
    @booking = policy_scope(Booking)
    @bookings = Booking.where(user_id: current_user.id)
    authorize @bookings
  end

  def create
    @movable = Movable.find(params[:movable_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.movable = @movable
    authorize @booking

    respond_to do |format|
      if @booking.save
        format.html { redirect_to bookings_path, notice: "Booking was successfull." }
        format.json { render :show, status: :created, location: @movable }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movable.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
  end


private


def booking_params
  params.require(:booking).permit(:checkin_on, :checkout_on )
end
end
