class Request < ApplicationRecord

  validates :approach_id, numericality: { other_than: 1}
  validates :term_id, numericality: { other_than: 1}
  validates :budget_id, numericality: { other_than: 1}

  has_many :orders
  has_many :engineers, through: :orders
  belongs_to :customer

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :approach
  belongs_to :budget
  belongs_to :term
end
