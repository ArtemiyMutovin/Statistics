class Statistic < ApplicationRecord
  after_create :give_rates_to_players

  belongs_to :game
  belongs_to :player

  validates :miles_run, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :success_passes_percentage, presence: true, numericality: { in: 0..100 }

  private

  def give_rates_to_players
    Rate.find_each do |rate|
      if send(rate.category).send(rate.condition, rate.expected_value)
        GameRate.create(game: game, player: player, rate: rate)
      end
    end
  end
end
