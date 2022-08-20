class QuizController < ApplicationController
  before_action :require_authentication, only: %i[try user_answer]
  skip_before_action :verify_authenticity_token, only: :user_answer

  def try; end

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
      render plain: 'Результат сохранен', status: :ok
    else
      render plain: attempt.errors.to_a.join(', '), status: :unprocessable_entity
    end
  end
end
