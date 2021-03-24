class Question < ApplicationRecord
  belongs_to :engineer
  has_many :answers
end
