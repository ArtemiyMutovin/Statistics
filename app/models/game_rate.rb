class GameRate < ApplicationRecord
  belongs_to :game
  belongs_to :rate
  belongs_to :player
end
