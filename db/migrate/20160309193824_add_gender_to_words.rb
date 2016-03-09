class AddGenderToWords < ActiveRecord::Migration[5.0]
  def change
    add_column :words, :gender, :string
  end
end
