class AddDataToUsers < ActiveRecord::Migration[7.0]
  def change
    change_table :users, bulk: true do |t|
      t.string :place_of_work
      t.string :education
      t.string :phone_number
    end
  end
end
