class User < ApplicationRecord
  has_many :activities
  has_many :bookings
  has_one_attached :user_photo
  # after_commit :add_default_user_profile, on: %i[create update]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def user_photo_thumbnail
    if user_photo.attached?
      user_photo.key
    else
      "https://res.cloudinary.com/dbyp3pr3d/image/upload/v1677701526/development/default_user_profile.png"
    end
  end

  private

  # def add_default_user_profile
  #   unless user_photo.attached?
  #     user_photo.attach(
  #       io: user_photo, 
  #       filename: "default_user_profile", 
  #       content_type: "image/png"
  #     )
  #   end
  # end
end
