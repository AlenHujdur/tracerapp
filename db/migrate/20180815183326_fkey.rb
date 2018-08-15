class Fkey < ActiveRecord::Migration[5.0]
  def change
    add_reference :cameras, :location, foreign_key: true
  end
end
