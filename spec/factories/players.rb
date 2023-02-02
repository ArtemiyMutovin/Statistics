FactoryBot.define do
  sequence :player_name do |n|
    "player #{n}"
  end

  factory :player do
    name { generate(:player_name) }
  end
end
