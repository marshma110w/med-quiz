class ChangeAttemptsResult < ActiveRecord::Migration[7.0]
  def change
    remove_column :attempts, :result, :json
    
    add_column :attempts, :asked_questions_count, :integer, null: false
    
    add_column :attempts, :opened_pulkoksimetr, :boolean
    add_column :attempts, :opened_ekg, :boolean
    add_column :attempts, :opened_glukometr, :boolean
    add_column :attempts, :opened_trop_test, :boolean

    add_column :attempts, :main_diagnosis, :string, null: false
    add_column :attempts, :diagnosis_complications, :string, array: true
    add_column :attempts, :diagnosis_accompanying_illnesses, :string, array: true

    add_column :attempts, :treatment_medicate, :jsonb
    add_column :attempts, :treatment_non_medicate, :string, array: true
    
  end
end
