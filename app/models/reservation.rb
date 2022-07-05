class Reservation < ApplicationRecord
  enum status: { 
    denied:   'denied',
    pending:  'pending',
    accepted: 'accepted'
  }
  belongs_to :guest
  has_one :payment
end
