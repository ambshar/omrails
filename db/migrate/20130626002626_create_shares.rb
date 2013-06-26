class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
