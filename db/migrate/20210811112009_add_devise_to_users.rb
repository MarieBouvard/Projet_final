# frozen_string_literal: true

class AddDeviseToUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

    end
  end
end
