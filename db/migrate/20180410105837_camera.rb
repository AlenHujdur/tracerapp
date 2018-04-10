class Camera < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :hidden_field, :image
    add_column :locations, :label, :image
  end
end
