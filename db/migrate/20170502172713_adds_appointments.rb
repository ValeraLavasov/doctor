class AddsAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.belongs_to  :medical_doctor, type: :id, index: true, null: false
      t.belongs_to  :patient, type: :id, index: true, null: false
      t.integer     :aasm_state, default: 0, null: false
      t.datetime    :appointed_to
      t.text        :comment

      t.timestamps null: false
    end

    add_index :appointments, %i(medical_doctor_id patient_id appointed_to), unique: true, name: 'uniq_time_appointment'
  end
end
