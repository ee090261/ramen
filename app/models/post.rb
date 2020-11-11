class Post < ApplicationRecord

	belongs_to :user
	has_many :post_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
    attachment :dish_image

    validates :menu_title, :shop_name, :adress, :comment, length: { minimum: 1 }
    validates :dish_image, :price, presence: true


end
