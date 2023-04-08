class CreateBookDeletedAt < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :deleted_at, :datetime, default: nil
    add_index :books, :deleted_at
  end
end
