class Addimageagain2 < ActiveRecord::Migration[5.0]
  def change
    remove_column :locations, :camera_id
  end
end
