class AddIndexToComments < ActiveRecord::Migration[5.0]
  def change
  		add_index :comments, :comment_id
  end
end
