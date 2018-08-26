class Cam112 < ActiveRecord::Migration[5.0]
  def change
    add_column :cameras, :location_id, :integer
  end
end
