# frozen_string_literal: true 

require "rails_helper"

module Reservations 
  describe Update do 

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
    let(:reservation)   { create(:reservation) }
    let(:outcome)       { described_class.run(payload.merge!(reservation: reservation)) }
    let(:error_message) { JSON.parse(outcome.errors.to_json) }

    it 'with valid payload' do 
     expect(outcome.valid?).to eq true 
    end

    describe 'allowed attributes to update' do 
      it 'status' do 
        payload[:status] = 'pending'
        outcome 

        expect(reservation.status).to eq 'pending'
      end 

      it 'start_date' do 
        payload[:start_date] = Date.current
        outcome 

        expect(reservation.start_date).to eq Date.current
      end

      it 'start_date' do 
        payload[:end_date] = Date.current + 5.days
        outcome 

        expect(reservation.end_date).to eq Date.current + 5.days
      end

      it 'nights' do 
        payload[:nights] = 5
        outcome 

        expect(reservation.nights).to eq 5
      end

      it 'adults' do 
        payload[:adults] = 5
        outcome 

        expect(reservation.adults).to eq 5
      end

      it 'children' do 
        payload[:children] = 5
        outcome 

        expect(reservation.children).to eq 5
      end

      it 'infants' do 
        payload[:infants] = 5
        outcome 

        expect(reservation.infants).to eq 5
      end
    end 
  end 
end 
