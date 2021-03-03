class Engineer::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :nickname, :image])
  end
end