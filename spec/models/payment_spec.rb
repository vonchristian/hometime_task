# frozen_string_literal: true 

require "rails_helper"
require "money-rails/test_helpers"

RSpec.describe Payment do 
  describe 'associations' do 
    it { is_expected.to belong_to :reservation }
  end 

  describe 'monetize' do 
    it { is_expected.to monetize(:payment_price) }
    it { is_expected.to monetize(:security_price) }
    it { is_expected.to monetize(:total_price) }
  end
end