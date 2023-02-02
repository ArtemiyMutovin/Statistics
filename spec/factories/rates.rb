FactoryBot.define do
  factory :rate do
    trait :miles_run do
      category { 'miles_run' }
      expected_value { 10 }
      condition { '>' }
    end

    trait :success_passes_percentage do
      category { 'success_passes_percentage' }
      expected_value { 70 }
      condition { '>' }
    end
  end
end
