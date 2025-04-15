class CreateFollows < ActiveRecord::Migration[7.2]
  def change
    create_table :follows do |t|
      t.references :follower, foreign_key: { to_table: :profiles }, null: false
      t.references :followed, foreign_key: { to_table: :profiles }, null: false
      t.timestamps
    end

    add_index :follows, %i[follower_id followed_id], unique: true
  end
end
