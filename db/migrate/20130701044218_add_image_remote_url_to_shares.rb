class AddImageRemoteUrlToShares < ActiveRecord::Migration
  def change
    add_column :shares, :image_remote_url, :string
  end
end
