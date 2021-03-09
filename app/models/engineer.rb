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
  has_many :payment_histories

  def name
    self.first_name + " " + self.last_name
  end

  def name_kana
    self.first_name + " " + self.last_name
  end
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :language
end
