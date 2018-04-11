class AddmyCameratolocations < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :my_camera, :image
  end
end
