class CreateTrolls < ActiveRecord::Migration[5.0]
  def change
    create_table :trolls do |t|
      t.string :login
      t.integer :site_id
      t.string :avatar_url

      t.timestamps
    end
    add_index :trolls, :login
  end
end
