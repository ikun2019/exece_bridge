class Card < ApplicationRecord
  attr_accessor :token

  belongs_to :engineer

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :month
  belongs_to :year
end
