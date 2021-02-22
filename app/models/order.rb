class Order < ApplicationRecord
  belongs_to :request
  has_one :engineer  
end
