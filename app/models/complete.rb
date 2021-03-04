class Complete < ApplicationRecord
  belongs_to :request
  belongs_to :engineer
  belongs_to :customer
end
