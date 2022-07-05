# frozen_string_literal: true 

require 'active_interaction'

module Reservations 
  class Update < ActiveInteraction::Base 
    object :reservation

    string :status, default: nil
    integer :nights, :adults, :children, :infants, default: nil
    date :start_date, :end_date, default: nil

    validates :start_date, presence: true, unless: -> { start_date.nil? }
    validates :end_date,   presence: true, unless: -> { end_date.nil? }
    validates :nights,     presence: true, unless: -> { nights.nil? }
    validates :adults,     presence: true, unless: -> { adults.nil? }
    validates :children,   presence: true, unless: -> { children.nil? }
    validates :infants,    presence: true, unless: -> { infants.nil? }
    validates :status,     presence: true, inclusion: { in: Reservation.statuses.keys }, unless: -> { status.nil? }

    def execute 
      update_reservation

      reservation
    end 

    private 

    def update_reservation
      reservation.start_date = start_date
      reservation.end_date   = end_date
      reservation.nights     = nights 
      reservation.adults     = adults 
      reservation.children   = children 
      reservation.infants    = infants 
      reservation.status     = status 

      errors.merge!(reservation.errors) unless reservation.save
    end
  end 
end 
