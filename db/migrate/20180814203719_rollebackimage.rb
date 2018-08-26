class Rollebackimage < ActiveRecord::Migration[5.0]
  def change
    add_column :cameras, :image, :string
  end
end
