class AddStrengthLevelToWords < ActiveRecord::Migration[5.0]
  def change
    add_column :words, :strength_level, :integer, null: false, default: 0
  end
end
