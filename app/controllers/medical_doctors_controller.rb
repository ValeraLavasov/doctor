class MedicalDoctorsController < ApiController
  def index
    @patients = MedicalDoctor.all
    render json: @patients.to_json, status: 200
  end

  def show
    @patient = MedicalDoctor.find(params[:id])
    render json: @patient.to_json(include: { appointments: { 
                                  only: %i(id aasm_state comment) } }), status: 200
  end
end
