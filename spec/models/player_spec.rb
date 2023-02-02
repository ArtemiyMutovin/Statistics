require 'rails_helper'

RSpec.describe Player, type: :model do
  let(:games) { create_list(:game, 6, home_team: home_team, away_team: away_team) }
  let(:player_without_rate) { create(:player, team: home_team) }
  let!(:player_with_rate) { create(:player, team: away_team) }
  let(:away_team) { create(:team) }
  let(:home_team) { create(:team) }
  let!(:rate) { create(:rate, :miles_run) }

  it { is_expected.to have_many :game_rates }
  it { is_expected.to have_many :rates }
  it { is_expected.to have_many :statistics }
  it { is_expected.to have_many :games }
  it { belong_to :team }
  it { is_expected.to validate_presence_of :name }

  describe 'top_five_by_rate' do
    context 'when players has the same rates' do
      let!(:statistic) { create(:statistic, :for_miles_run_rate, game: games.first, player: player_with_rate) }

      let!(:statistic_second) do
        create(:statistic,
               :for_miles_run_rate,
               game: games.first,
               player: player_without_rate)
      end

      let!(:statistic_third) do
        create(:statistic,
               :for_miles_run_rate,
               game: games.first,
               player: player_with_rate)
      end

      it 'returns top 5 players in rates count order' do
        expect(described_class.top_five_by_rate('miles_run')).to eq([player_with_rate, player_without_rate])
      end

      it 'returns top 5 players in one team in rates count order' do
        expect(described_class.top_five_by_rate('miles_run', home_team.id)).to eq([player_without_rate])
      end
    end
  end

  describe 'rate_in_last_five_games?(rate_category)' do
    let!(:statistic) { create(:statistic, :for_miles_run_rate, game: games.first, player: player_with_rate) }

    context 'when player has rate in last 5 games' do
      it 'returns true' do
        expect(player_with_rate).to be_rate_in_last_five_games('miles_run')
      end
    end

    context 'when player has no rate in last 5 games' do
      it 'returns false' do
        expect(player_without_rate).not_to be_rate_in_last_five_games('miles_run')
      end
    end
  end
end
