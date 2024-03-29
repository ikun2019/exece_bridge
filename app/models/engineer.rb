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

  enum role: {user: 0, admin: 1}
  
  VALIS_EISU_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,100}+\z/i
  with_options presence: true do
    validates :first_name, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "：「ひらがな」「漢字」で入力してください"}
    validates :last_name, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "：「ひらがな」「漢字」で入力してください"}
    validates :first_name_kana, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "：「カタカナ」で入力してください"}
    validates :last_name_kana, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "：「カタカナ」で入力してください"}
    validates :nickname
    validates :email, format: {with: /\A\S+@\S+\.\S+\z/, message: "：正しいemailを入力してください"}
    validates :password, format: {with: VALIS_EISU_REGEX, message: "：パスワードは半角英数字混合8文字以上で作成してください"}, on: :create
    validates :password_confirmation, format: {with: VALIS_EISU_REGEX, message: "：パスワードは半角英数字混合8文字以上で作成してください"}, on: :create
  end

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
