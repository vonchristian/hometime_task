class Payment < ApplicationRecord
  monetize :total_price_cents, as: :total_price
  monetize :payment_price_cents, as: :payment_price
  monetize :security_price_cents, as: :security_price

  belongs_to :reservation
end
