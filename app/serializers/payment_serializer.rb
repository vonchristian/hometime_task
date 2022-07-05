class PaymentSerializer
  include JSONAPI::Serializer

  attribute :id, :currency, :payment_price, :total_price, :security_price
end 