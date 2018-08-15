class Removeimage < ActiveRecord::Migration[5.0]
  def change
    remove_column :locations, :image
  end
end
