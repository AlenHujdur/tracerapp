class Fixdatatype < ActiveRecord::Migration[5.0]
  def change
    remove_column :locations, :my_camera
    add_column :locations, :image, :string
  end
end
