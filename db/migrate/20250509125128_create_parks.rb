class CreateParks < ActiveRecord::Migration[7.2]
  def change
    create_table :parks do |t|
      t.string :name
      t.text :description
      t.string :address
      t.string :image

      t.timestamps
    end
  end
end
