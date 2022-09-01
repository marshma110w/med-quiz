# == Schema Information
#
# Table name: attempts
#
#  id                               :bigint           not null, primary key
#  asked_questions_count            :integer          default(0), not null
#  diagnosis_accompanying_illnesses :string           is an Array
#  diagnosis_complications          :string           is an Array
#  main_diagnosis                   :string           default(""), not null
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
class Attempt < ApplicationRecord
  belongs_to :user

  validates :asked_questions_count, :main_diagnosis, presence: true

  def main_diagnosis_correct?
    main_diagnosis == correct_main_diagnosis
  end

  def diagnosis_complications_correct?
    diagnosis_complications.empty?
  end

  def diagnosis_accompanying_illnesses_correct?
    content_equal?(diagnosis_accompanying_illnesses, correct_ilnesses)
  end

  def treatment_medicate_correct?
    content_equal?(treatment_medicate, correct_treatment_medicate)
  end

  def treatment_non_medicate_correct?
    content_equal?(treatment_non_medicate, correct_treatment_non_medicate)
  end

  def instrumental_researches_opened
    [opened_ekg, opened_glukometr, opened_pulkoksimetr, opened_trop_test]
  end

  private

  def content_equal?(a, b)
    (a - b).empty? && (b - a).empty?
  end

  def correct_ilnesses
    ['Сахарный диабет инсулиннезависимый',
     'Гипертоническая болезнь',
     'Остеохондроз позвоночника']
  end

  def correct_main_diagnosis
    'Острый коронарный синдром с подъёмом ST'
  end

  def correct_treatment_medicate
    [
      {
        name: 'Анальгетики',
        drugs: %w[Морфин Фентанил],
        drugsType: 'or',
        drugsCount: 2
      },
      {
        name: 'Нитраты',
        drugs: ['Нитроглицерин', 'Изосорбид динитрат'],
        drugsType: 'or',
        drugsCount: 2
      },
      {
        name: 'Средства, влияющие на свертывание крови',
        drugs: ['Гепарин', 'Ацетилсалициловая кислота', 'Клопидогрел'],
        drugsType: 'and',
        drugsCount: 3
      },
      {
        name: 'Тромболитики',
        drugs: %w[Алтеплаза Тенектеплаза Фортелизин],
        drugsType: 'onlyOne',
        drugsCount: 3
      },
      {
        name: 'Антиаритмические средства',
        drugs: ['Метопролол'],
        drugsType: 'and',
        drugsCount: 1
      }
    ]
  end

  def correct_treatment_non_medicate
    ['Внутривенный доступ',
     'Оксигенотерапия']
  end
end
