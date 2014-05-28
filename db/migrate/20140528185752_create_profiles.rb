class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :age
      t.string :location
      t.string :affliction
      t.text :tags, array: true

      t.timestamps
    end
  end
end
