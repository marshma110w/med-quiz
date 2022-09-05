class AddSpecializationToUsers < ActiveRecord::Migration[7.0]
  def change
    change_table :users, bulk: true do |t|
      t.string :specialization
    end
  end
end
