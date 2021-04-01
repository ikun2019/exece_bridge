class Training < ApplicationRecord

  with_options presence: true do
    validates :title
    validates :detail
    validates :genre_id
    validates :lesson_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :lesson
end
