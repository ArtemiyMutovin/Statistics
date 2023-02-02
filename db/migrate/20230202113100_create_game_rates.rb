class CreateGameRates < ActiveRecord::Migration[7.0]
  def change
    create_table :game_rates do |t|
      t.references :game, foreign_key: true, index: true
      t.references :rate, foreign_key: true, index: true
      t.references :player, foreign_key: true, index: true

      t.timestamps
    end
  end
end
