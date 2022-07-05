class GuestSerializer
  include JSONAPI::Serializer

  attribute :id, :email, :first_name, :last_name
end 