class CreateRates < ActiveRecord::Migration[7.0]
  def change
    create_table :rates do |t|
      t.string :category, null: false
      t.integer :expected_value, null: false, default: 0
      t.string :condition, null: false, default: '>'

      t.timestamps
    end
  end
end
