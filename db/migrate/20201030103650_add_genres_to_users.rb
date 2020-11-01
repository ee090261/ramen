class AddGenresToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :genres, :integer
  end
end
