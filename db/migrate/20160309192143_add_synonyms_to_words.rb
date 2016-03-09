class AddSynonymsToWords < ActiveRecord::Migration[5.0]
  def change
    add_column :words, :synonyms, :string
  end
end
