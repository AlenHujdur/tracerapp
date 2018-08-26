class Rollebackimageupdate < ActiveRecord::Migration[5.0]
  def up
    change_column :cameras, :image, :string, :null => true
  end

  def down
    change_column :cameras, :image, :string
  end
end
