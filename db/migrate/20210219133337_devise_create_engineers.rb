# frozen_string_literal: true

class DeviseCreateEngineers < ActiveRecord::Migration[6.0]
  def change
    create_table :engineers do |t|
      ## Database authenticatable
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :first_name_kana, null: false
      t.string :last_name_kana, null: false
      t.string :nickname, null: false
      t.integer :acceptable_area, null: false, default: 1
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.text :profile
      t.integer :language_id, default: 1

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end

    add_index :engineers, :email,                unique: true
    add_index :engineers, :reset_password_token, unique: true
    # add_index :engineers, :confirmation_token,   unique: true
    # add_index :engineers, :unlock_token,         unique: true
  end
end
