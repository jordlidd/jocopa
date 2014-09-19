class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :title
      t.string :host
      t.string :description
      t.string :location
      t.integer :price

      t.timestamps
    end
  end
end
