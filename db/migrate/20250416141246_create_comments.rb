class CreateComments < ActiveRecord::Migration[7.2]
  def change
    create_table :comments do |t|
      t.references :profile, null: false, foreign_key: true
      t.references :track, null: false, foreign_key: true
      t.text :content, null: false
      t.timestamps
    end
  end
end
