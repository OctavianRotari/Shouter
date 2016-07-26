class MakeShoutsPolymorphic < ActiveRecord::Migration[5.0]
  def up
    remove_column :shouts, :body
    add_column :shouts, :content_type, :string
    add_column :shouts, :content_id, :integer
    add_index :shouts, [:content_type, :content_id]
  end

  def down
    remove_index :shouts, [:content_type, :content_id]
    add_column :shouts, :body, :string
    remove_column :shouts, :content_type
    remove_column :shouts, :content_id
  end
end
