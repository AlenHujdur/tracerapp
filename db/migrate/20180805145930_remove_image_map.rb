class RemoveImageMap < ActiveRecord::Migration[5.0]
  def down
    remove_column :cameras, :map_image
  end

  def up
    add_column :locations, :map_image, :string
  end
end
