class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
  end

  def show
    @activity = Activity.find(params[:id])
    @user_card = User.find(@activity.user_id)
  end

  def new
    @activity = Activity.new
  end

  def create
    User.all.find_each do |user|
      @new_activity = Activity.new(activities_params)
      @new_activity.user_id = user.id
      @new_activity.save
    end
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
