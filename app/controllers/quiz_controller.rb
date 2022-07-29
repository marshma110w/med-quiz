class QuizController < ApplicationController

  skip_before_action :verify_authenticity_token, only: :user_answer

  def try
  end

  def user_answer
    render plain: params
  end
end
