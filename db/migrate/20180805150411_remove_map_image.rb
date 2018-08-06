class RemoveMapImage < ActiveRecord::Migration[5.0]
  def change
    remove_column :cameras, :map_image
  end
end
