class Engineer::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :nickname, :image])
    permit(:account_update, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :nickname, :study_id, :language_id, :profile, :image])
    permit(:sign_in, keys: [:remember_me])
  end
end