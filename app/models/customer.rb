class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_one_attached :image
  has_many :requests


  def name
    self.first_name + " " +self.last_name
  end

  def name_kana
    self.first_name_kana + " " + self.last_name_kana
  end
  
  
end
