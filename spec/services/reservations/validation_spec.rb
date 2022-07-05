# frozen_string_literal: true 

require "rails_helper"

module Reservations 
  describe Validation do 

    let(:payload) do 
      {
        :code=>"YYY12345678",
        :email=>"wayne_woodbridge@bnb.com",
        :first_name=>"Wayne",
        :last_name=>"Woodbridge",
        :start_date=>"2021-04-14",
        :end_date=>"2021-04-18",
        :nights=>4,
        :adults=>2,
        :children=>2,
        :infants=>0,
        :status=>"accepted",
        :currency=>"AUD",
        :payment_price=>"4200.00",
        :security_price=>"500",
        :total_price=>"4700.00"
      }
    end

    let(:outcome)       { described_class.run(payload) }
    let(:error_message) { JSON.parse(outcome.errors.to_json) }

    it 'with valid payload' do 
     expect(outcome.valid?).to eq true 
    end

    describe "status" do 
      describe "is in allowed list" do 
        before do 
          payload[:status] = 'bad-status'
        end 

        it { expect(outcome.valid?).to eq false  }
        it 'error message' do 
          expect(error_message).to eq({"status"=>["is not included in the list"]})
        end 
      end

      describe "validate presence" do 
        before do 
          payload[:status] = nil
        end 

        it { expect(outcome.valid?).to eq false  }
        it 'error message' do 
          expect(error_message).to eq({"status"=>["is required"]})
        end 
      end

      describe "is string type" do 
        before do 
          payload[:status] = 123
        end 

        it { expect(outcome.valid?).to eq false  }

        it 'error message' do 
          expect(error_message).to eq({"status"=>["is not a valid string"]})
        end 
      end
    end

    describe "code" do 
      describe "validate presence" do 
        before do 
          payload[:code] = nil
        end 

        it { expect(outcome.valid?).to eq false  }
        it 'error message' do 
          expect(error_message).to eq({"code"=>["is required"]})
        end 
      end

      describe "is string type" do 
        before do 
          payload[:code] = 123
        end 

        it { expect(outcome.valid?).to eq false  }

        it 'error message' do 
          expect(error_message).to eq({"code"=>["is not a valid string"]})
        end 
      end
    end

    describe "email" do 
      describe "validate presence" do 
        before do 
          payload[:email] = nil
        end 

        it { expect(outcome.valid?).to eq false  }
        it 'error message' do 
          expect(error_message).to eq({"email"=>["is required"]})
        end 
      end

      describe "is string type" do 
        before do 
          payload[:email] = 123
        end 

        it { expect(outcome.valid?).to eq false  }

        it 'error message' do 
          expect(error_message).to eq({"email"=>["is not a valid string"]})
        end 
      end

      describe "format is email" do 
        before do 
          payload[:email] = "invalid-email@"
        end 

        it { expect(outcome.valid?).to eq false  }

        it 'error message' do 
          expect(error_message).to eq({"email"=>["is invalid"]})
        end 
      end
    end

    describe "start_date" do 
      describe "validate presence" do 
        before do 
          payload[:start_date] = nil
        end 

        it { expect(outcome.valid?).to eq false  }
        it 'error message' do 
          expect(error_message).to eq({"start_date"=>["is required"]})
        end 
      end

      describe "is date type" do 
        before do 
          payload[:start_date] = 123
        end 

        it { expect(outcome.valid?).to eq false  }

        it 'error message' do 
          expect(error_message).to eq({"start_date"=>["is not a valid date"]})
        end 
      end
    end

    describe "end_date" do 
      describe "validate presence" do 
        before do 
          payload[:end_date] = nil
        end 

        it { expect(outcome.valid?).to eq false  }
        it 'error message' do 
          expect(error_message).to eq({"end_date"=>["is required"]})
        end 
      end

      describe "is date type" do 
        before do 
          payload[:end_date] = 123
        end 

        it { expect(outcome.valid?).to eq false  }

        it 'error message' do 
          expect(error_message).to eq({"end_date"=>["is not a valid date"]})
        end 
      end
    end

    describe "nights" do 
      describe "validate presence" do 
        before do 
          payload[:nights] = nil
        end 

        it { expect(outcome.valid?).to eq false  }
        it 'error message' do 
          expect(error_message).to eq({"nights"=>["is required"]})
        end 
      end

      describe "is integer type" do 
        before do 
          payload[:nights] = 'bad'
        end 

        it { expect(outcome.valid?).to eq false  }

        it 'error message' do 
          expect(error_message).to eq({"nights"=>["is not a valid integer"]})
        end 
      end
    end

    describe "adults" do 
      describe "validate presence" do 
        before do 
          payload[:adults] = nil
        end 

        it { expect(outcome.valid?).to eq false  }
        it 'error message' do 
          expect(error_message).to eq({"adults"=>["is required"]})
        end 
      end

      describe "is integer type" do 
        before do 
          payload[:adults] = 'bad'
        end 

        it { expect(outcome.valid?).to eq false  }

        it 'error message' do 
          expect(error_message).to eq({"adults"=>["is not a valid integer"]})
        end 
      end
    end

    describe "children" do 
      describe "validate presence" do 
        before do 
          payload[:children] = nil
        end 

        it { expect(outcome.valid?).to eq false  }
        it 'error message' do 
          expect(error_message).to eq({"children"=>["is required"]})
        end 
      end

      describe "is integer type" do 
        before do 
          payload[:children] = 'bad'
        end 

        it { expect(outcome.valid?).to eq false  }

        it 'error message' do 
          expect(error_message).to eq({"children"=>["is not a valid integer"]})
        end 
      end
    end

    describe "infants" do 
      describe "validate presence" do 
        before do 
          payload[:infants] = nil
        end 

        it { expect(outcome.valid?).to eq false  }
        it 'error message' do 
          expect(error_message).to eq({"infants"=>["is required"]})
        end 
      end

      describe "is integer type" do 
        before do 
          payload[:infants] = 'bad'
        end 

        it { expect(outcome.valid?).to eq false  }

        it 'error message' do 
          expect(error_message).to eq({"infants"=>["is not a valid integer"]})
        end 
      end
    end

    describe "total_price" do 
      describe "validate presence" do 
        before do 
          payload[:total_price] = nil
        end 

        it { expect(outcome.valid?).to eq false  }
        it 'error message' do 
          expect(error_message).to eq({"total_price"=>["is required"]})
        end 
      end

      describe "is decimal type" do 
        before do 
          payload[:total_price] = 'bad'
        end 

        it { expect(outcome.valid?).to eq false  }

        it 'error message' do 
          expect(error_message).to eq({"total_price"=>["is not a valid decimal"]})
        end 
      end
    end

    describe "security_price" do 
      describe "validate presence" do 
        before do 
          payload[:security_price] = nil
        end 

        it { expect(outcome.valid?).to eq false  }
        it 'error message' do 
          expect(error_message).to eq({"security_price"=>["is required"]})
        end 
      end

      describe "is decimal type" do 
        before do 
          payload[:security_price] = 'bad'
        end 

        it { expect(outcome.valid?).to eq false  }

        it 'error message' do 
          expect(error_message).to eq({"security_price"=>["is not a valid decimal"]})
        end 
      end
    end

    describe "payment_price" do 
      describe "validate presence" do 
        before do 
          payload[:payment_price] = nil
        end 

        it { expect(outcome.valid?).to eq false  }
        it 'error message' do 
          expect(error_message).to eq({"payment_price"=>["is required"]})
        end 
      end

      describe "is decimal type" do 
        before do 
          payload[:payment_price] = 'bad'
        end 

        it { expect(outcome.valid?).to eq false  }

        it 'error message' do 
          expect(error_message).to eq({"payment_price"=>["is not a valid decimal"]})
        end 
      end
    end
  end 
end 
