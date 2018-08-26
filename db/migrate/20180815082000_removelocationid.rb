class Removelocationid < ActiveRecord::Migration[5.0]
  def change
    remove_column :cameras, :location_id
  end
end
