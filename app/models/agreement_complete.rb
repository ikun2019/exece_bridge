class AgreementComplete
  include ActiveModel::Model
  attr_accessor :request_id, :engineer_id, :order_id, :answer, :conclusion, :customer_id

  with_options presence: true do
    validates :request_id
    validates :engineer_id
    validates :order_id
    validates :answer
    validates :customer_id
  end

  def save
    Agreement.create(request_id: request_id, engineer_id: engineer_id, order_id: order_id, answer: answer)
    Complete.create(request_id: request_id, conclusion: conclusion, engineer_id: engineer_id, customer_id: customer_id)
  end
  
end