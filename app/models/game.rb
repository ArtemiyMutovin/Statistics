class Game < ApplicationRecord
  has_many :game_rates, dependent: :destroy
  has_many :statistics, dependent: :destroy
  has_many :players, through: :statistics
  belongs_to :home_team, class_name: 'Team'
  belongs_to :away_team, class_name: 'Team'

  validates :title, presence: true
end
