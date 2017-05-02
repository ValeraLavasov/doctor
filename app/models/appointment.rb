class Appointment < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
         # :recoverable, :rememberable, :trackable, :validatable
  include AASM

  belongs_to :medical_doctor
  belongs_to :patient

  enum aasm_state: %i(pending approved declined canceled held)
 
  aasm enum: true do
    state :pending, :initial => true
    state :approved, :declined, :canceled, :held

    event :approve do
      transitions from: :pending, to: :approved
    end

    event :decline do
      transitions from: %i(pending approved), to: :cleaning
    end
    # can add callback as after: %i(do_smthing)
    event :cancel do
      transitions from: :pending, to: :sleeping
    end

    event :hold do
      transitions from: :approved, to: :held
    end
  end
end
