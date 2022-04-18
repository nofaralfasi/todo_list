class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.belongs_to :list
      t.belongs_to :label
      t.string :title
      t.string :due_date
      t.string :priority
      t.boolean :status

      t.timestamps
    end
  end
end
