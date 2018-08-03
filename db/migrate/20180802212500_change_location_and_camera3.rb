class ChangeLocationAndCamera3 < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :camera_id, :integer
  end
end
