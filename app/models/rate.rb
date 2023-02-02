class Rate < ApplicationRecord
  DEFAULT_CATEGORIES = %w[miles_run success_passes_percentage].freeze
  DEFAULT_CONDITIONS = %w[> < =].freeze
  has_many :game_rates, dependent: :destroy
  has_many :players, through: :game_rates

  validates :category, presence: true, inclusion: { in: DEFAULT_CATEGORIES }
  validates :expected_value, presence: true, numericality: { greater_than: 0 }
  validates :condition, presence: true, inclusion: { in: DEFAULT_CONDITIONS }
end
