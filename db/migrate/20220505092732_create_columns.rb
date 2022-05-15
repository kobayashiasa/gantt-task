class CreateColumns < ActiveRecord::Migration[6.0]
  def change
    create_table :columns do |t|
      t.string :column_title, null: false
      t.references :user, foreign_key: true, null: false
      t.integer :row_order

      t.timestamps
    end
  end
end
