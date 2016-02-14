class CreateWords < ActiveRecord::Migration[5.0]
  def change
    create_table :words do |t|
      t.references :user, foreign_key: true, null: false
      t.string :content, null: false
      t.string :translation
      t.text :excerpt
      t.datetime :last_practiced_at

      t.timestamps
    end
  end
end
