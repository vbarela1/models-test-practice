class AddWarrantyToCars < ActiveRecord::Migration[5.0]
  def change
    add_column :cars, :warranty, :boolean
  end
end
