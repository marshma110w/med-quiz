# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  name            :string           not null
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  has_many :attempts, dependent: :destroy

  has_secure_password

  validates :email, uniqueness: { case_sensetive: false }
  validates_presence_of :name
  validates_length_of :name, in: 3..40
  validates_presence_of :email
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP

  before_validation :downcase_email

  private

  def downcase_email
    self.email.downcase! if self.email       
  end

end
