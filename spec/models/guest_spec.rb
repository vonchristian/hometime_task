# frozen_string_literal: true 

require "rails_helper"

RSpec.describe Guest do 
  describe 'associations' do 
    it { is_expected.to have_many :reservations }
  end 
  
  describe "validations" do 
    it { is_expected.to validate_presence_of :email }
  end 
end
