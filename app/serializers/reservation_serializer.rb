class ReservationSerializer
  include JSONAPI::Serializer

  attribute :id, :code, :start_date, :end_date, :nights, :adults, :children, 
            :infants, :status, :guest, :payment
end 