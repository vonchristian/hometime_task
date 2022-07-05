# frozen_string_literal: true 

require 'active_interaction'

module Reservations 
  class Create < ActiveInteraction::Base 
    string :code, :email, :first_name, :last_name, :status, :currency
    integer :nights, :adults, :children, :infants
    decimal :total_price, :security_price, :payment_price
    date :start_date, :end_date

    validates :start_date, presence: true
    validates :end_date,   presence: true
    validates :nights,     presence: true
    validates :adults,     presence: true
    validates :children,   presence: true
    validates :infants,    presence: true
    validates :payment_price, presence: true 
    validates :total_price, presence: true 
    validates :security_price, presence: true
    validates :status,     presence: true, inclusion: { in: Reservation.statuses.keys } 
    def execute 
      ApplicationRecord.transaction do
        create_guest
        create_reservation
        create_payment
      end 
      @reservation
    end 

    private 
    
    def create_guest
      @guest ||= Guest.new(
        email:      email, 
        first_name: first_name, 
        last_name:  last_name
      )

      errors.merge!(@guest.errors) unless @guest.save 
    end

    def create_reservation
      @reservation ||= Reservation.new(
        code:       code, 
        start_date: start_date,
        end_date:   end_date,
        nights:     nights, 
        adults:     adults,
        children:   children,
        infants:    infants,
        status:     status,
        guest_id:   @guest&.id
      )

      errors.merge!(@reservation.errors) unless @reservation.save 
    end

    def create_payment
      payment ||= Payment.new(
        reservation_id: @reservation&.id,
        currency: currency,
        payment_price: payment_price,
        security_price: security_price,
        total_price: total_price
      )

      errors.merge!(payment.errors) unless payment.save 
    end
  end 
end 
