class CreateProfiles < ActiveRecord::Migration[7.2]
  def change
    create_table :profiles do |t|
      t.timestamps
      t.string :name
      t.string :username, null: false
      t.text :bio
      t.references :user, null: false, foreign_key: true
    end

    add_index :profiles, :username, unique: true
  end
end
