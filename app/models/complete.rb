class Complete < ApplicationRecord
  belongs_to :request
  belongs_to :engineer
  belongs_to :customer

  def completed?
    return true if self.conclustion == true
  end
  
end
