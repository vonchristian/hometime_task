# frozen_string_literal: true 

FactoryBot.define do 
  factory :reservation do 
    association :guest
  end 
end 