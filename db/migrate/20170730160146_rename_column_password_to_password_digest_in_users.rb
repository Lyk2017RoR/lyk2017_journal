class RenameColumnPasswordToPasswordDigestInUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :password, :password_digest
    change_column :users, :password_digest, :string, null: false
  end
end
