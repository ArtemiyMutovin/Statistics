class Team < ApplicationRecord
  has_many :games, foreign_key: :home_team_id, dependent: :destroy, inverse_of: :home_team
  has_many :games, foreign_key: :away_team_id, dependent: :destroy, inverse_of: :away_team
  has_many :players, dependent: :destroy

  validates :name, presence: true
end
