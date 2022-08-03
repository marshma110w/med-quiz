class QuizController < ApplicationController

  skip_before_action :verify_authenticity_token, only: :user_answer

  def try
  end

  def user_answer
    render plain: params
  end
end

# Need to know this:

# asked_questions_count: int
# physical_research_opened: bool
# opened_pulskoksimetr: bool
# opened_ekg: bool
# opened_glukometr: bool
# opened_trop_test: bool

# main_diagnosis: string
# diagnosis_complications: arr
# diagnosis_accompanying_illnesses: arr

# treatment_medicate: json
# treatment_non_medicate: arr