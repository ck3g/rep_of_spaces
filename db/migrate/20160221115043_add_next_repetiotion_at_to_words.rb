class AddNextRepetiotionAtToWords < ActiveRecord::Migration[5.0]
  def change
    add_column :words, :next_repetition_at, :datetime
  end
end
