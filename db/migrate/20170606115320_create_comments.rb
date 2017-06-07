class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.references :troll, foreign_key: true
      t.datetime :date
      t.string :domain_prefix
      t.string :url
      t.string :text
      t.integer :comment_id
      t.integer :text_size

      t.timestamps
    end
    add_index :comments, :domain_prefix
  end
end
