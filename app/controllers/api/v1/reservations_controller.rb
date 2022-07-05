# frozen_string_literal: true 

module API 
  module V1 
    class ReservationsController < ApplicationController 
      def create 
        return json_error_response unless run_validations.valid?
        return update_reservation if reservation.present?
        
        create_reservation 
      end 

      private 
      
      def run_validations
        @validations ||= Reservations::Validation.run(payload)
      end 
      
      def json_error_response
        error_response(ErrorSerializer.serialize(@validations).to_json, :unprocessable_entity)
      end 

      def update_reservation
        outcome = Reservations::Update.run(update_reservation_payload.merge!(reservation: reservation))

        if outcome.valid?
          success_response_with_top_level_message(ReservationSerializer.new(outcome.result))
        else
          error_response(ErrorSerializer.serialize(outcome), :unprocessable_entity)
        end
      end

      def create_reservation
        outcome = Reservations::Create.run(payload)

        if outcome.valid?
          success_response_with_top_level_message(ReservationSerializer.new(outcome.result))
        else
          error_response(ErrorSerializer.serialize(outcome), :unprocessable_entity)
        end
      end

      def payload
        Reservations::Payload.generate(
          params.merge!(
            reservation_code: reservation_code
          )
        )
      end

      def update_reservation_payload
        payload.slice(
          :start_date, 
          :end_date,
          :nights,
          :adults,
          :children,
          :infants,
          :status
        )
      end

      def reservation_code 
        params.dig(:reservation_code) || params.dig(:reservation, :code)
      end

      def reservation
        @reservation ||= Reservation.find_by(code: reservation_code)
      end
    end 
  end 
end 
