class Fixinglocationcolumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :locations, :hidden_field
    remove_column :locations, :label
  end
end
