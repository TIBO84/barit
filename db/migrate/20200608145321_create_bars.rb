class CreateBars < ActiveRecord::Migration[6.0]
  def change
    create_table :bars do |t|
      t.string :name
      t.integer :capacity
      t.string :ambiance
      t.string :address
      t.string :city
      t.references :owner, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
