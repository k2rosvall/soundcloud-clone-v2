class CreateTracks < ActiveRecord::Migration[7.2]
  def change
    create_table :tracks do |t|
      t.timestamps
      t.string :name, null: false
      t.text :description
      t.references :profile, null: false, foreign_key: true
    end
  end
end
