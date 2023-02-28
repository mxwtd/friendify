class FriendsController < ApplicationController
  def index
    if current_user
      @friends = current_user.friends
      user = User.find(current_user.id)

      if @friends.count == 0
        friends_list = Friend.where(user_id: 1)

        friends_list.all.find_each do |friend|
          user.friends << Friend.create!(
            name: friend.name,
            age: friend.age,
            email: friend.email,
            photo_url: friend.photo_url,
            description: friend.description, 
            location: friend.location, 
            price: friend.price, 
            user_id: user.id
          )
        end
      end
    end
  end

  def show
    @friend = Friend.find(params[:id])
  end

  def new
    @friend = Friend.new
  end

  def create
    User.all.find_each do |user|
      @new_friend = Friend.new(friends_params)
      @new_friend.user_id = user.id
      @new_friend.save
    end
    redirect_to friends_path
  end

  def edit
    @friend = Friend.find(params[:id])
  end

  def update
    friend = Friend.find(params[:id])
    friend_email = friend.email
    friends_to_edit = Friend.where(email: friend_email)
    friends_to_edit.each { |friend| friend.update(friends_params) }
    redirect_to friends_path
  end

  def destroy
    friend = Friend.find(params[:id])
    friend_email = friend.email
    friends_to_delete = Friend.where(email: friend_email)
    friends_to_delete.each { |friend| friend.destroy }
    redirect_to friends_path, status: :see_other
  end

  def add_listing
    @friend = Friend.find(params[:id])
    @friend.is_friend = true
  end

  private

  def friends_params
    params.require(:friend).permit(:name, :age, :email,:description, :location, :price)
  end
end
