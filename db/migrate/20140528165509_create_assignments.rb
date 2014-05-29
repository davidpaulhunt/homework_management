class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :title
      t.date :due_date
      t.string :state
      t.string :content

      t.timestamps
    end
  end
end
