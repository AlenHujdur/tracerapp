class Addmapimage < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :map_image, :string
  end
end
