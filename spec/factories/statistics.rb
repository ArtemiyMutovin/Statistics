FactoryBot.define do
  factory :statistic do
    trait :for_miles_run_rate do
      miles_run { 11 }
      success_passes_percentage { 10 }
    end

    trait :for_success_passes_rate do
      miles_run { 9 }
      success_passes_percentage { 81 }
    end

    trait :for_all_rates do
      miles_run { 22 }
      success_passes_percentage { 99 }
    end

    trait :without_rates do
      miles_run { 9 }
      success_passes_percentage { 68 }
    end
  end
end
