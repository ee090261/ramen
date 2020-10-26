class Post < ApplicationRecord

	belongs_to :user
    attachment :dish_image
end
