class CreatePosts < ActiveRecord::Migration
  def up
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.belongs_to :user
      t.boolean :is_publish, :default => true
      t.timestamps
    end
  end

  def down
    drop_table :posts
  end
end
