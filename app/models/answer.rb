class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :engineer

  with_options presence: true do
    validates :answer
  end
end
