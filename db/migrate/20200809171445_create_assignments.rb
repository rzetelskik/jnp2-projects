class CreateAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :assignments do |t|
      t.integer :user_id
      t.references :project, null: false, foreign_key: true
      t.boolean :active, default: true

      t.timestamps
      t.index [:user_id, :project_id], unique: true
    end
  end
end