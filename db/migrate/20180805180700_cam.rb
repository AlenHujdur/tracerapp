class Cam < ActiveRecord::Migration[5.0]
  def change
    remove_column :cameras, :image
  end
end
