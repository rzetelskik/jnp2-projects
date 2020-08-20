class CreateTaskAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :task_assignments do |t|
      t.integer :user_id
      t.references :task, null: false, foreign_key: true

      t.timestamps
      t.index [:user_id, :task_id], unique: true
    end
  end
end
