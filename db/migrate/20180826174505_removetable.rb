class Removetable < ActiveRecord::Migration[5.0]
  def change
    drop_table :cameras
  end
end
