class ChangeLocationAndCamera2 < ActiveRecord::Migration[5.0]
  def change
    remove_column :locations, :map_image
  end
end
