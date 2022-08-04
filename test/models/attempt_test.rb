# == Schema Information
#
# Table name: attempts
#
#  id                               :bigint           not null, primary key
#  asked_questions_count            :integer          not null
#  diagnosis_accompanying_illnesses :string           is an Array
#  diagnosis_complications          :string           is an Array
#  main_diagnosis                   :string           not null
#  opened_ekg                       :boolean
#  opened_glukometr                 :boolean
#  opened_pulkoksimetr              :boolean
#  opened_trop_test                 :boolean
#  treatment_medicate               :jsonb
#  treatment_non_medicate           :string           is an Array
#  created_at                       :datetime         not null
#  updated_at                       :datetime         not null
#  user_id                          :bigint
#
# Indexes
#
#  index_attempts_on_user_id  (user_id)
#
require "test_helper"

class AttemptTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
