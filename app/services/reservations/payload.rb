
module Reservations 
  class Payload
    attr_reader :params, :reservation_code

    def self.generate(args = {})
      obj = new(args)
      obj.run 
    end 

    def initialize(args = {})
      @params           = args 
      @reservation_code = args.fetch(:reservation_code)
    end

    def run 
      generate_payload
    end 

    private 

    def generate_payload
      {
        code:           reservation_code,
        email:          email,
        first_name:     first_name,
        last_name:      last_name,
        start_date:     start_date,
        end_date:       end_date,
        nights:         nights,
        adults:         adults,
        children:       children,
        infants:        infants,
        status:         status,
        currency:       currency,
        payment_price:  payment_price, 
        security_price: security_price, 
        total_price:    total_price
      }
    end
    
    def email 
      params.dig(:guest_email) || params.dig(:reservation, :guest_email)
    end 

    def first_name 
      params.dig(:first_name) || params.dig(:reservation, :guest_first_name)
    end
    
    def last_name 
      params.dig(:last_name) || params.dig(:reservation, :guest_last_name)
    end
  
    def start_date
      params.dig(:start_date) || params.dig(:reservation, :start_date)
    end

    def end_date
      params.dig(:end_date) || params.dig(:reservation, :end_date)
    end

    def nights
      params.dig(:nights) || params.dig(:reservation, :nights)
    end

    def adults
      params.dig(:adults) || params.dig(:reservation, :guest_details, :number_of_adults)
    end

    def children
      params.dig(:children) || params.dig(:reservation, :guest_details, :number_of_children)
    end

    def infants 
      params.dig(:infants) || params.dig(:reservation, :guest_details, :number_of_infants)
    end

    def status 
      params.dig(:status) || params.dig(:reservation, :status_type)
    end

    def currency
      params.dig(:currency) || params.dig(:reservation, :host_currency)
    end

    def payment_price
      params.dig(:payout_price) || params.dig(:reservation, :expected_payout_amount)
    end

    def security_price
      params.dig(:security_price) || params.dig(:reservation, :listing_security_price_accurate)
    end 
    
    def total_price
      params.dig(:total_price) || params.dig(:reservation, :total_paid_amount_accurate)
    end
  end 
end 