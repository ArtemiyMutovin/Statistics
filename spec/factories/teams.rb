FactoryBot.define do
  sequence :name do |n|
    "player #{n}"
  end

  factory :team do
    name
  end
end
