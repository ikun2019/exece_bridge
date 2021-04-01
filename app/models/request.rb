class Request < ApplicationRecord

  validates :approach_id, numericality: { other_than: 1}
  validates :term_id, numericality: { other_than: 1}
  validates :budget_id, numericality: { other_than: 1}

  has_many :orders
  has_many :engineers, through: :orders
  belongs_to :customer
  has_many :agreements
  has_one :complete

  with_options presence: true do
    validates :customer_id
    validates :title
    validates :content
    with_options numericality: {other_than: 1} do
      validates :budget_id
      validates :term_id
      validates :approach_id
    end
  end

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
