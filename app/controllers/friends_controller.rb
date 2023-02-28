class FriendsController < ApplicationController
  def index
    @friends = Friend.all
  end

  def show
    @friend = Friend.find(params[:id])
  end

  def new
    @friend = Friend.new
  end


  def edit
    @friend = Friend.find(params[:id])
  end

  def update
    @friend = Friend.find(params[:id])
    @friend = Friend.update(friends_params)
    redirect_to friends_path(friends_params)
  end

  def destroy
    @friend = Friend.find(params[:id])
    @friend.destroy
    redirect_to friends_path, status: :see_other
  end

  def add_listing
    @friend = Friend.find(params[:id])
    @friend.is_friend = true

  end

  def information
    @friend = Friend.find(params[:id])
  end

  private

  def friends_params
    params.require(:friend).permit(:description, :location, :price)
  end
end
