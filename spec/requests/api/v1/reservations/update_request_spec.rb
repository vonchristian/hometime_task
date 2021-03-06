# frozen_string_literal: true

require 'rails_helper'

describe 'Update reservation V1 format', type: :request do
  let!(:guest)       { create(:guest, email: "wayne_woodbridge@bnb.com") }
  let!(:reservation) { create(:reservation, guest: guest, code: "YYY12345678") }

  context "with V1 format" do 
    let(:v1_format_params) do
      {
        "reservation": {
          "code": "YYY12345678",
          "start_date": "2021-03-12",
          "end_date": "2021-03-16",
          "expected_payout_amount": "3800.00",
          "guest_details": {
            "localized_description": "4 guests",
            "number_of_adults": 20,
            "number_of_children": 2,
            "number_of_infants": 1
          },
          "guest_email": "wayne_woodbridge@bnb.com",
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

    describe 'POST /api/v1/reservations/' do
      context 'with valid params' do

        before do 
          post '/api/v1/reservations/', params: v1_format_params
        end

        it 'returns http status of :ok' do
          expect(response).to have_http_status(:ok)
        end

        it 'returns JSON response' do
          expect(JSON.parse(response.body)).to eq JSON.parse(ReservationSerializer.new(Reservation.last).to_hash.merge({ message: 'Success' }).to_json)
        end
      end

      context 'with invalid params' do
        before do
          v1_format_params[:reservation][:status_type] = nil 

          post '/api/v1/reservations/', params: v1_format_params
        end

        it 'returns http status of :unprocessable_entity' do
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it 'returns errors' do
          expect(JSON.parse(response.body)).to eq({ 'errors' => { 'status' => ['is required'] } })
        end
      end
    end
  end

  context 'with V2 format', type: :request do
    let(:v2_format_params) do
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

    describe 'POST /api/v1/reservations/' do
      context 'with valid params' do

        before do 
          post '/api/v1/reservations/', params: v2_format_params
        end

        it 'returns http status of :ok' do
          expect(response).to have_http_status(:ok)
        end

        it 'returns JSON response' do
          expect(JSON.parse(response.body)).to eq JSON.parse(ReservationSerializer.new(Reservation.last).to_hash.merge({ message: 'Success' }).to_json)
        end
      end

      context 'with invalid params' do
        before do
          v2_format_params[:status] = nil 

          post '/api/v1/reservations/', params: v2_format_params
        end

        it 'returns http status of :ok' do
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it 'returns errors' do
          expect(JSON.parse(response.body)).to eq({ 'errors' => { 'status' => ['is required'] } })
        end
      end
    end
  end
end 
