class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.integer :notifieable_id
      t.string :notifieable_type
    end

    add_column :submissions, :state, :string
  end
end
