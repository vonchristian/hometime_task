# frozen_string_literal: true 

module API 
  module V1 
    class ReservationsController < ApplicationController 
      def create 
        return json_error_response unless validate_params.valid?
        return create_reservation if reservation.blank?

        update_reservation 
      end 

      private 
      
      def validate_params
        @validate_params ||= Reservations::Validation.run(reservation_params)
      end 
      
      def json_error_response
        error_response(ErrorSerializer.serialize(@validate_params).to_json, :unprocessable_entity)
      end 

      def update_reservation
        outcome = Reservations::Update.run(update_reservation_params.merge!(reservation: reservation))

        if outcome.valid?
          success_response_with_top_level_message(ReservationSerializer.new(outcome.result))
        else
          error_response(ErrorSerializer.serialize(outcome), :unprocessable_entity)
        end
      end

      def create_reservation
        outcome = Reservations::Create.run(reservation_params)

        if outcome.valid?
          success_response_with_top_level_message(ReservationSerializer.new(outcome.result), :created)
        else
          error_response(ErrorSerializer.serialize(outcome), :unprocessable_entity)
        end
      end

      def reservation_params
        @reservation_params ||= Reservations::Payload.generate(params)
      end

      def update_reservation_params
        reservation_params.slice(
          :start_date, 
          :end_date,
          :nights,
          :adults,
          :children,
          :infants,
          :status
        )
      end

      def reservation
        @reservation ||= Reservation.find_by(code: reservation_params.dig(:code))
      end
    end 
  end 
end 
