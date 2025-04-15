class AddFollowersFollowingCountToProfiles < ActiveRecord::Migration[7.2]
  def change
    add_column :profiles, :followers_count, :int, default: 0
    add_column :profiles, :following_count, :int, default: 0
  end
end
