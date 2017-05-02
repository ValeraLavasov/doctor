class MedicalDoctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :appointments
  has_many :patients, through: :appointments

  enum speciality: %i(pediatrition physician)
  enum status: %i(available unavailable)
end
