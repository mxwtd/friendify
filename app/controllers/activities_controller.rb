class ActivitiesController < ApplicationController
  def index
    if params[:query].present?
      sql_query = <<~SQL
        activities.location ILIKE :query
        OR activities.description ILIKE :query
        OR activities.category ILIKE :query
      SQL
      @activities = Activity.where(sql_query, query: "%#{params[:query]}%")
    else
      @activities = Activity.all
    end
  end

  def show
    @activity = Activity.find(params[:id])
    @user_card = User.find(@activity.user_id)
    @booking = Booking.new
  end

  def new
    @activity = Activity.new
  end

  def create
    @new_activity = Activity.new(activities_params)
    @new_activity.user_id = current_user.id
    @new_activity.save

    redirect_to activities_path
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    activity = Activity.find(params[:id])
    activity.update(activities_params)

    redirect_to activities_path
  end

  def destroy
    activity = Activity.find(params[:id])
    activity.destroy

    redirect_to activities_path, status: :see_other
  end

  def add_listing
    @activity = Activity.find(params[:id])
    @activity.is_activity = true
  end

  private

  def activities_params
    params.require(:activity).permit(:name, :age, :email,:description, :location, :price, :photo)
  end
end
