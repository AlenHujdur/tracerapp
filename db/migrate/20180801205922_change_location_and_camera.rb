class ChangeLocationAndCamera < ActiveRecord::Migration[5.0]
  def change
    remove_column :locations, :image, :map_image
  end
end
