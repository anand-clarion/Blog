class ChangeCommentcolumn < ActiveRecord::Migration
  def up
    change_column :comments, :is_active, :boolean, :default => false
  end

  def down
    change_column :comments, :is_active, :boolean, :default => true
  end

end
