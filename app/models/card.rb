class Card < ApplicationRecord
  attr_accessor :token, :card_token

  belongs_to :engineer

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :month
  belongs_to :year
end
