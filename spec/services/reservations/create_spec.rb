# frozen_string_literal: true 

require "rails_helper"

module Reservations 
  describe Create do 

    let(:payload) do 
      {
        :code=>"YYY12345678",
        :email=>"wayne_woodbridge@bnb.com",
        :first_name=>"Wayne",
        :last_name=>"Woodbridge",
        :start_date=>"2021-04-14",
        :end_date=>"2021-04-18",
        :nights=>4,
        :adults=>2,
        :children=>2,
        :infants=>0,
        :status=>"accepted",
        :currency=>"AUD",
        :payment_price=>"4200.00",
        :security_price=>"500",
        :total_price=>"4700.00"
      }
    end

    let(:outcome)       { described_class.run(payload) }
    let(:error_message) { JSON.parse(outcome.errors.to_json) }

    it 'with valid payload' do 
     expect(outcome.valid?).to eq true 
    end

    it 'creates a reservation record' do 
      expect { outcome }.to change { Reservation.count }.by(1)
    end

    it 'creates a guest record' do 
      expect { outcome }.to change { Guest.count }.by(1)
    end

    it 'creates a payment record' do 
      expect { outcome }.to change { Payment.count }.by(1)
    end
  end 
end 
