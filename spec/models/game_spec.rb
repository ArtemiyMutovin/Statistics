require 'rails_helper'

RSpec.describe Game, type: :model do
  it { is_expected.to have_many :game_rates }
  it { is_expected.to have_many :statistics }
  it { is_expected.to have_many :players }
  it { belong_to :home_team }
  it { belong_to :away_team }
  it { is_expected.to validate_presence_of :title }
end
