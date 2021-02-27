class Request < ApplicationRecord

  validates :approach_id, numericality: { other_than: 1}
  validates :term_id, numericality: { other_than: 1}
  validates :budget_id, numericality: { other_than: 1}

  has_many :orders
  has_many :engineers, through: :orders
  belongs_to :customer
  has_one :agreement

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :approach
  belongs_to :budget
  belongs_to :term

  def engineer_apply(user)
    if self.orders.where(engineer_id: user).present?
      applied = true
    else
      applied = false
    end
    return applied
  end

  def customer_agreement
    if self.orders.present?
      agreements = self.orders
    end
    return agreements
  end
  
end
