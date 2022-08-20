class RemoveIntegerFromAttempts < ActiveRecord::Migration[7.0]
  def change
    remove_column :attempts, :integer, :integer
  end
end
