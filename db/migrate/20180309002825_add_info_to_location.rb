class AddInfoToLocation < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :info, :string
  end
end
