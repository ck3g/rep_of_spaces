class CreateWordCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :word_categories do |t|
      t.references :word, foreign_key: true, null: false
      t.references :category, foreign_key: true, null: false

      t.timestamps
    end
  end
end
