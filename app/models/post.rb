class Post < ApplicationRecord

	belongs_to :user
	has_many :post_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
    attachment :dish_image

	  def favorited_by?(user)
	    favorites.where(user_id: user.id).exists?
	  end

end
