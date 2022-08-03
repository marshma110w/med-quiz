# == Schema Information
#
# Table name: attempts
#
#  id                               :bigint           not null, primary key
#  asked_questions_count            :integer          not null
#  diagnosis_accompanying_illnesses :string           not null, is an Array
#  diagnosis_complications          :string           not null, is an Array
#  main_diagnosis                   :string           not null
#  opened_ekg                       :boolean          not null
#  opened_glukometr                 :boolean          not null
#  opened_pulkoksimetr              :boolean          not null
#  opened_trop_test                 :boolean          not null
#  physical_research_opened         :boolean          not null
#  treatment_medicate               :jsonb            not null
#  treatment_non_medicate           :string           not null, is an Array
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
