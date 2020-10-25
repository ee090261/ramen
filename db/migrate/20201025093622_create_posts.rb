class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :dish_image_id
      t.string :menu_title
      t.integer :user_id
      t.string :price
      t.text :comment

      t.timestamps
    end
  end
end
