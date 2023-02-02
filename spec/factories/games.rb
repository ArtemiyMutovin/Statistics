FactoryBot.define do
  sequence :title do |n|
    "game #{n}"
  end

  factory :game do
    title
  end
end
