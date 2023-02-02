require 'rails_helper'

RSpec.describe Rate, type: :model do
  it { is_expected.to have_many :game_rates }
  it { is_expected.to have_many :players }
  it { is_expected.to validate_presence_of :category }
  it { is_expected.to validate_inclusion_of(:category).in_array(%w[miles_run success_passes_percentage]) }
  it { is_expected.to validate_presence_of :condition }
  it { is_expected.to validate_inclusion_of(:condition).in_array(%w[> < =]) }
  it { is_expected.to validate_presence_of :expected_value }
  it { is_expected.to allow_value(1).for(:expected_value) }
  it { is_expected.not_to allow_value(0).for(:expected_value) }
end
