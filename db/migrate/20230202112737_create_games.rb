class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :title, null: false
      t.references :home_team, foreign_key: { to_table: :teams }, index: true
      t.references :away_team, foreign_key: { to_table: :teams }, index: true

      t.timestamps
    end
  end
end
