class Addcam < ActiveRecord::Migration[5.0]
  create_table :cameras do |c|
    c.string :image
    c.string :map_image

    c.timestamps
  end
end
