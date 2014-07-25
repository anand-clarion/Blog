class CreateComments < ActiveRecord::Migration
  def up
    create_table :comments do |t|
      t.string :title
      t.text :content
      t.belongs_to :user
      t.belongs_to :post
      t.boolean :is_active, :default => true
      t.timestamps
    end
  end

  def down
    drop_table :comments
  end
end
