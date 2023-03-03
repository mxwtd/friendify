class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    booking = Booking.find(params[:id])
    booking.update(activities_params)

    redirect_to bookings_path
  end

  def destroy
    activity = Booking.find(params[:id])
    activity.destroy

    redirect_to bookings_path, status: :see_other
  end

  def new
    @booking = Booking.new
    @booking = Activity.find(params[:activity_id])
  end

  def create
    activity = Activity.find(activity_params)
    @booking = Booking.new(booking_params)
    @booking.activity = activity
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :comment)
  end

  def activity_params
    params.require(:activity_id)
  end
end
