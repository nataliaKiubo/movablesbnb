class BookingsController < ApplicationController
  # def new
  #   @booking = Booking.new
  #   @movable = Movable.find(params[:id])
  #   authorize @booking
  # end

  def create
    @movable = Movable.find(params[:movable_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.movable = @movable
    authorize @booking

    respond_to do |format|
      if @booking.save
        format.html { redirect_to movable_url(@movable), notice: "Booking was successfully transferred." }
        format.json { render :show, status: :created, location: @movable }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movable.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def delete
  end


private


def booking_params
  params.require(:booking).permit(:checkin_on, :checkout_on )
end
end
