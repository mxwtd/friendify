class BookingsController < ApplicationController

  def index
    # if params[:query].present?
    #   sql_query = <<~SQL
    #     activities.location ILIKE :query
    #     OR activities.description ILIKE :query
    #     OR activities.category ILIKE :query
    #   SQL
    #   @bookings = Activity.where(sql_query, query: "%#{params[:query]}%")
    # else
    #   @bookings = Booking.all
    # end
    # @bookings = Booking.where()
    # @activities_booking = B
    # bookings = Booking.all
    @my_bookings = Booking.where(user_id: current_user.id)
    # my_activities = Activity.where(user_id: current_user.id)
    # activity_booked = Booking.where()
    # @activities_booked = Booking.where.not(user_id: current_user.id)
    # @activities_id = my_activities.select do |activity|
    #   Booking.where(activity_id: activity.id)
    # end

    # @activities_booked = bookings.select do |book|
    #   book.activity_id == activities_id
    # end
  end

  def show
    @booking = Booking.find(params[:id])
    @activity = Activity.find(@booking.activity_id)
    @user_card = User.find(@activity.user_id)
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
    raise
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
