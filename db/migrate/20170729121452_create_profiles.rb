class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :gravatar
      t.string :first_name
      t.string :last_name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
