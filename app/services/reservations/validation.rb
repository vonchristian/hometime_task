# frozen_string_literal: true 
require 'active_interaction'

module Reservations 
  class Validation < ActiveInteraction::Base 
    string :code, :email, :status
    date :start_date, :end_date

    validates :code, :start_date, :end_date, :email, presence: true
    validates :email, email: true
    validates :status, presence: true, inclusion: { in: Reservation.statuses.keys }

    def execute
    end
  end 
end 