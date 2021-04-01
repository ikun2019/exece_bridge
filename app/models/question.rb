class Question < ApplicationRecord
  belongs_to :engineer
  has_many :answers

  with_options presence: true do
    validates :title
    validates :content
  end
end
