class CreateParts < ActiveRecord::Migration[5.0]
  def change
    create_table :parts do |t|
      t.string :serial_number
      t.string :name
      t.belongs_to :car, foreign_key: true

      t.timestamps
    end
  end
end
