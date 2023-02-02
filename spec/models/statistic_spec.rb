require 'rails_helper'

RSpec.describe Statistic, type: :model do
  it { belong_to :game }
  it { belong_to :player }
  it { is_expected.to allow_value(1).for(:miles_run) }
  it { is_expected.to allow_value(1).for(:success_passes_percentage) }

  describe '.give_rates_to_players' do
    let!(:rate) { create(:rate, :miles_run) }
    let(:home_team) { create(:team) }
    let(:away_team) { create(:team) }
    let(:player_with_rate) { create(:player, team: home_team) }
    let(:player_without_rate) { create(:player, team: away_team) }
    let(:game) { create(:game, home_team: home_team, away_team: away_team) }

    context 'when statistic was created' do
      context 'when statistic for rate' do
        let!(:statistic) { create(:statistic, :for_miles_run_rate, game: game, player: player_with_rate) }

        it 'gives rate to player' do
          expect(player_with_rate.rates.count).to be(1)
        end
      end

      context 'when statistic not for rate' do
        let!(:underrated_statistic) { create(:statistic, :without_rates, game: game, player: player_without_rate) }

        it "doesn't gives rate to player" do
          expect(player_without_rate.rates.count).to be(0)
        end
      end
    end
  end
end
