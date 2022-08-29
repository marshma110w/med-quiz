ActiveAdmin.register Attempt do
  
    index(:row_class => -> record {'correct_answer' if record.main_diagnosis_correct?}) do
      selectable_column
      id_column
      column :user_id
      column :main_diagnosis
      column :asked_questions_count
      column :diagnosis_accompanying_illnesses
      column :diagnosis_complications
      column :opened_ekg
      column :opened_glukometr
      column :opened_pulkoksimetr
      column :opened_pulkoksimetr
      column :opened_trop_test
      list_column :treatment_medicate
      column :treatment_non_medicate
      column :created_at
    end
  
    filter :user_id
    filter :created_at
  
  end
  