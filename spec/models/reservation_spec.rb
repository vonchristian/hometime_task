# frozen_string_literal: true 

require "rails_helper"

RSpec.describe Reservation do 
  describe 'associations' do 
    it { is_expected.to belong_to :guest }
    it { is_expected.to have_one :payment }
  end 

  describe "enums" do 
    it do 
      is_expected.to define_enum_for(:status)
        .with_values(
          denied: "denied", 
          pending: "pending", 
          accepted: "accepted")
        .backed_by_column_of_type(:string)
    end 
  end 
end