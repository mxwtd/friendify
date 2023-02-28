class FriendsController < ApplicationController
  def index
    if current_user
       @friends = current_user.friends
    else
      redirect_to new_user_session_path, notice: 'You are not logged in'
    end
  end

  def show
    @friend = Friend.find(params[:id])
  end

  def new
    @friend = Friend.new
  end

  def create
    raise
    @new_friend = Bookmark.new(bookmark_params)
    @new_friend.list = @list
    @new_friend.save

    # redirecst_to friends_path(@f)
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

  private

  def friends_params
    params.require(:friend).permit(:description, :location, :price)
  end
end
