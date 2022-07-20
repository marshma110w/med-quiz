# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string           not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  has_many :attempts, dependent: :destroy

  validates :email, uniqueness: { case_sensetive: false }
  validates :name, presence: true
  validates :email, presence: true

  before_validation :downcase_email

  private

  def downcase_email
    email.downcase!        
  end

end
