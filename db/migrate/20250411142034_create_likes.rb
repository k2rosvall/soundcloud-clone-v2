class CreateLikes < ActiveRecord::Migration[7.2]
  def change
    create_table :likes do |t|
      t.references :profile, null: false, foreign_key: true
      t.references :track, null: false, foreign_key: true
      t.timestamps
    end
  end
end
