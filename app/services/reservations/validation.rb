# frozen_string_literal: true 

require 'active_interaction'

module Reservations 
  class Validation < ActiveInteraction::Base 
    string :code, :email, :status
    date :start_date, :end_date
    integer :nights, :adults, :children, :infants
    decimal :total_price, :security_price, :payment_price

    validates :code, :start_date, :end_date, :email, 
              :nights, :adults, :children, :infants, 
              :total_price, :security_price, :payment_price, presence: true
              
    validates :email, email: true
    validates :status, presence: true, inclusion: { in: Reservation.statuses.keys }

    def execute
    end
  end 
end 