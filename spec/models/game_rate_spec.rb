require 'rails_helper'

RSpec.describe GameRate, type: :model do
  it { is_expected.to belong_to(:game) }
  it { is_expected.to belong_to(:rate) }
  it { is_expected.to belong_to(:player) }
end
