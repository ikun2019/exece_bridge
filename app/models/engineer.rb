class Engineer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_one_attached  :image
  has_many :orders
  has_many :requests, through: :orders
  has_many :agreements
  has_many :completes
  has_one :card, dependent: :destroy
  has_many :ratings
  has_many :questions
  has_many :answers

  def name
    self.first_name + " " + self.last_name
  end

  def name_kana
    self.first_name_kana + " " + self.last_name_kana
  end
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :language
  belongs_to :study
end
