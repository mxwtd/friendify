class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
    @friend = Friend.find(params[:friend_id])
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  #def bookings_listS
  #end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :comment)
  end
end
