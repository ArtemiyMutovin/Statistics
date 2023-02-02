class Player < ApplicationRecord
  has_many :game_rates, dependent: :destroy
  has_many :rates, through: :game_rates
  has_many :statistics, dependent: :destroy
  has_many :games, through: :statistics
  belongs_to :team

  validates :name, presence: true

  def self.top_five_by_rate(rate, team_id = nil)
    players = team_id.present? ? Player.where(team_id: team_id) : self
    players.joins(:rates)
           .where(rates: { category: rate })
           .group('players.id')
           .order('COUNT(rates.id) DESC')
           .first(5)
  end

  def rate_in_last_five_games?(rate_category)
    rate_id = Rate.find_by(category: rate_category).id
    return false if rate_id.blank?

    if GameRate.where(rate_id: rate_id, game_id: games.last(5)&.pluck(:id)).count.zero?
      false
    else
      true
    end
  end
end
