class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :task_title, null: false, limit:100
      t.text :task_info, limit: 500
      t.references :column, null: false, foreign_key: true
      t.timestamps
    end
  end
end
