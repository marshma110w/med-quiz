class QuizController < ApplicationController

  before_action :require_authentication, only: %i[try, user_answer]
  skip_before_action :verify_authenticity_token, only: :user_answer

  def try
  end

  def user_answer
    attempt = current_user.attempts.build  
    
    attempt.asked_questions_count = params[:askedQuestionsCount]
    
    attempt.opened_pulkoksimetr = params[:openedPulkoksimetr]
    attempt.opened_ekg = params[:openedEkg]
    attempt.opened_glukometr = params[:openedGlukometr]
    attempt.opened_trop_test = params[:openedTroponinovyjTest]
    
    attempt.main_diagnosis = params[:diagnosisMain]
    attempt.diagnosis_complications = params[:diagnosisComplications]
    attempt.diagnosis_accompanying_illnesses = params[:diagnosisAccompanyingIllnesses]
    
    attempt.treatment_medicate = params[:treatmentMedicate]
    attempt.treatment_non_medicate = params[:treatmentNonMedicate]

    if attempt.valid?
      attempt.save
      render plain: "Result saved", status: 200
    else
      render plain: attempt.errors.to_a.join(", "), status: 422
    end

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
