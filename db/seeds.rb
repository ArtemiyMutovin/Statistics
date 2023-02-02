# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Team.destroy_all
Player.destroy_all
Rate.destroy_all
Game.destroy_all
Statistic.destroy_all
GameRate.destroy_all

Team.create!([{ name: 'Home Team' }, { name: 'Away Team' }])

['Home Team', 'Away Team'].each do |team_name|
  team = Team.find_by(name: team_name)
  3.times do |i|
    Player.create!(name: "Player #{team_name + i.to_s}", team: team)
  end
end

Rate.create!([{ category: 'miles_run', expected_value: 10 },
              { category: 'success_passes_percentage', expected_value: 70 }])

Game.create!([{ title: 'first game', home_team: Team.first, away_team: Team.last },
              { title: 'second game', home_team: Team.last, away_team: Team.first },
              { title: 'third game', home_team: Team.first, away_team: Team.last }])

Statistic.create!([{ game: Game.first, player: Player.first, miles_run: 3, success_passes_percentage: 20 },
                   { game: Game.first, player: Player.last, miles_run: 11, success_passes_percentage: 80 },
                   { game: Game.last, player: Player.first, miles_run: 15, success_passes_percentage: 50 },
                   { game: Game.second, player: Player.second, miles_run: 9,
                     success_passes_percentage: 90 }])
GameRate.create!([{ game: Game.first, player: Player.last, rate: Rate.first },
                  { game: Game.first, player: Player.last, rate: Rate.last },
                  { game: Game.last, player: Player.first, rate: Rate.first },
                  { game: Game.second, player: Player.second, rate: Rate.last }])
