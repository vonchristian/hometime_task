# frozen_string_literal: true 

require "rails_helper"

module Reservations 
  RSpec.describe Payload do 
    subject(:payload) { described_class.generate(params) }

    context "with V1 format" do 
      let(:params) do
        {
          "reservation": {
            "code": "16325s2XXX3612sd3343562178",
            "start_date": "2021-03-12",
            "end_date": "2021-03-16",
            "expected_payout_amount": "3800.00",
            "guest_details": {
              "localized_description": "4 guests",
              "number_of_adults": 20,
              "number_of_children": 2,
              "number_of_infants": 1
            },
            "guest_email": "1w625a316s3d3yne_wo2odbridge@b1nb.com",
            "guest_first_name": "Wayne",
            "guest_last_name": "Woodbridge",
            "guest_phone_numbers": [
              "639123456789",
              "639123456789"
            ],
            "listing_security_price_accurate": "500.00",
            "host_currency": "AUD",
            "nights": 4,
            "number_of_guests": 4,
            "status_type": "accepted",
            "total_paid_amount_accurate": "4300.00"
          }
        }
      end

      describe "payload content" do 
        it "code" do 
          expect(payload.dig(:code)).to eq params.dig(:reservation, :code)
        end

        it "email" do 
          expect(payload.dig(:email)).to eq params.dig(:reservation, :guest_email)
        end

        it "first_name" do 
          expect(payload.dig(:first_name)).to eq params.dig(:reservation, :guest_first_name)
        end

        it "last_name" do 
          expect(payload.dig(:last_name)).to eq params.dig(:reservation, :guest_last_name)
        end

        it "start_date" do 
          expect(payload.dig(:start_date)).to eq params.dig(:reservation, :start_date)
        end

        it "end_date" do 
          expect(payload.dig(:end_date)).to eq params.dig(:reservation, :end_date)
        end

        it "nights" do 
          expect(payload.dig(:nights)).to eq params.dig(:reservation, :nights)
        end

        it "adults" do 
          expect(payload.dig(:adults)).to eq params.dig(:reservation, :guest_details, :number_of_adults)
        end

        it "children" do 
          expect(payload.dig(:children)).to eq params.dig(:reservation, :guest_details, :number_of_children)
        end

        it "infants" do 
          expect(payload.dig(:infants)).to eq params.dig(:reservation, :guest_details, :number_of_infants)
        end

        it "status" do 
          expect(payload.dig(:status)).to eq params.dig(:reservation, :status_type)
        end

        it "currency" do 
          expect(payload.dig(:currency)).to eq params.dig(:reservation, :host_currency)
        end

        it "payment_price" do 
          expect(payload.dig(:payment_price)).to eq params.dig(:reservation, :expected_payout_amount)
        end

        it "security_price" do 
          expect(payload.dig(:security_price)).to eq params.dig(:reservation, :listing_security_price_accurate)
        end

        it "total_price" do 
          expect(payload.dig(:total_price)).to eq params.dig(:reservation, :total_paid_amount_accurate)
        end
      end 
    end 

    context "with V2 format" do 
      let(:params) do
        {
          "reservation_code": "YYY12345678",
          "start_date": "2021-04-14",
          "end_date": "2021-04-18",
          "nights": 4,
          "guests": 4,
          "adults": 2,
          "children": 2,
          "infants": 0,
          "status": "accepted",
          "guest": {
            "first_name": "Wayne",
            "last_name": "Woodbridge",
            "phone": "639123456789",
            "email": "wayne_woodbridge@bnb.com"
          },
          "currency": "AUD",
          "payout_price": "4200.00",
          "security_price": "500",
          "total_price": "4700.00"
        }
      end

      describe "payload content" do 
        it "code" do 
          expect(payload.dig(:code)).to eq params.dig(:reservation_code)
        end

        it "email" do 
          expect(payload.dig(:email)).to eq params.dig(:guest, :email)
        end

        it "first_name" do 
          expect(payload.dig(:first_name)).to eq params.dig(:guest, :first_name)
        end

        it "last_name" do 
          expect(payload.dig(:last_name)).to eq params.dig(:guest, :last_name)
        end

        it "start_date" do 
          expect(payload.dig(:start_date)).to eq params.dig(:start_date)
        end

        it "end_date" do 
          expect(payload.dig(:end_date)).to eq params.dig(:end_date)
        end

        it "nights" do 
          expect(payload.dig(:nights)).to eq params.dig(:nights)
        end

        it "adults" do 
          expect(payload.dig(:adults)).to eq params.dig(:adults)
        end

        it "children" do 
          expect(payload.dig(:children)).to eq params.dig(:children)
        end

        it "infants" do 
          expect(payload.dig(:infants)).to eq params.dig(:infants)
        end

        it "status" do 
          expect(payload.dig(:status)).to eq params.dig(:status)
        end

        it "currency" do 
          expect(payload.dig(:currency)).to eq params.dig(:currency)
        end

        it "payment_price" do 
          expect(payload.dig(:payment_price)).to eq params.dig(:payout_price)
        end

        it "security_price" do 
          expect(payload.dig(:security_price)).to eq  params.dig(:security_price)
        end

        it "total_price" do 
          expect(payload.dig(:total_price)).to eq  params.dig(:total_price)
        end
      end 
    end 
  end 
end 
