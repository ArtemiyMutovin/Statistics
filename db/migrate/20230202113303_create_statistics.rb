class CreateStatistics < ActiveRecord::Migration[7.0]
  def change
    create_table :statistics do |t|
      t.references :game, foreign_key: true, index: true
      t.references :player, foreign_key: true, index: true
      t.integer :miles_run, null: false, default: 0
      t.integer :success_passes_percentage, null: false, default: 0

      t.timestamps
    end
  end
end
