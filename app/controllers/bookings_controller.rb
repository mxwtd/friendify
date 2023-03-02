class BookingsController < ApplicationController
  before_action :set_friend, except: :index


  def index
    @bookings = Booking.where(user_id: current_user.id)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.friend = @friend
    @booking.user = current_user
    if @booking.save
      redirect_to friend_booking_path(@friend, @booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def set_friend
    @friend = Friend.find(params[:friend_id])
  end



  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :comment)
  end
end
