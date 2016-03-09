class AddAntonymsToWords < ActiveRecord::Migration[5.0]
  def change
    add_column :words, :antonyms, :string
  end
end
