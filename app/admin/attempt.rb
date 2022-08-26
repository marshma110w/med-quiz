ActiveAdmin.register Attempt do
  
    index do
      selectable_column
      id_column
      column :asked_questions_count
      column :diagnosis_accompanying_illnesses
      column :diagnosis_complications
      column :main_diagnosis
      column :opened_ekg
      column :opened_glukometr
      column :opened_pulkoksimetr
      column :opened_pulkoksimetr
      column :opened_trop_test
      column :treatment_medicate
      column :treatment_non_medicate
      column :created_at
      column :user_id
    end
  
    filter :user_id
    filter :created_at
  
  end
  