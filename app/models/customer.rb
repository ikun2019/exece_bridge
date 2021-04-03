class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_one_attached :image
  has_many :requests
  has_many :completes
  has_many :ratings

  enum role: {user: 0, admin: 1}

  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  VALIS_EISU_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,100}+\z/i
  with_options presence: true do
    validates :first_name, format: {with: VALID_NAME_REGEX, message: "：「ひらがな」「漢字」で入力してください"}
    validates :last_name, format: {with: VALID_NAME_REGEX, message: "：「ひらがな」「漢字」で入力してください"}
    validates :first_name_kana, format: {with: VALID_NAME_REGEX, message: "：「カタカナ」で入力してください"}
    validates :last_name_kana, format: {with: VALID_NAME_REGEX, message: "：「カタカナ」で入力してください"}
    validates :nickname
    validates :post_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "：「-」を入れた郵便番号を入力してください"}
    validates :prefecture_id, format: {with: /\A[0-9]+\z/}
    validates :city, format: {with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: "：「ひらがな」「カタカナ」「漢字」で入力してください"}
    validates :house_number
    validates :phone_number, format: {with: /\A\d{11}\z/, message: "：「-」無し、11桁で入力してください"}
    validates :email, format: {with: /\A\S+@\S+\.\S+\z/, message: "：正しいemailを入力してください"}
    validates :password, format: {with: VALIS_EISU_REGEX, message: "：パスワードは半角英数字混合8文字以上で作成してください"}
    validates :password_confirmation, format: {with: VALIS_EISU_REGEX, message: "：パスワードは半角英数字混合8文字以上で作成してください"}
  end

  def name
    self.first_name + " " +self.last_name
  end

  def name_kana
    self.first_name_kana + " " + self.last_name_kana
  end
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
