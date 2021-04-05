class Customer::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :nickname, :image, :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number])
    permit(:account_update, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :nickname, :image, :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number])
    permit(:sign_in, keys: [:remember_me])
  end
end