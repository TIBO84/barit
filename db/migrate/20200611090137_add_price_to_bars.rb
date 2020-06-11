class AddPriceToBars < ActiveRecord::Migration[6.0]
  def change
    add_column :bars, :description, :string
    add_column :bars, :price, :integer
  end
end
