class AddColumn2Submissions < ActiveRecord::Migration
  def change
    remove_column :submissions, :state
    add_column :submissions, :state, :string
  end
end
