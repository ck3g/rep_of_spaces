class AddPracticesCountToWords < ActiveRecord::Migration[5.0]
  def change
    add_column :words, :practices_count, :integer, null: false, default: 0
    add_index :words, :practices_count
  end
end
