class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.belongs_to :list
      t.belongs_to :label
      t.string :title
      t.datetime :due_date
      t.integer :priority
      t.boolean :status

      t.timestamps
    end
  end
end
