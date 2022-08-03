class ChangeAttemptsResult < ActiveRecord::Migration[7.0]
  def change
    remove_column :attempts, :result, :json
    add_column :attempts, :asked_questions_count, :integer, null: false
    add_column :attempts, :physical_research_opened, :boolean, null: false
    
    add_column :attempts, :opened_pulkoksimetr, :boolean, null: false
    add_column :attempts, :opened_ekg, :boolean, null: false
    add_column :attempts, :opened_glukometr, :boolean, null: false
    add_column :attempts, :opened_trop_test, :boolean, null: false

    add_column :attempts, :main_diagnosis, :string, null: false
    add_column :attempts, :diagnosis_complications, :string, array: true, null: false
    add_column :attempts, :diagnosis_accompanying_illnesses, :string, array: true, null: false

    add_column :attempts, :treatment_medicate, :jsonb, null: false
    add_column :attempts, :treatment_non_medicate, :string, array: true, null: false
    
  end
end
