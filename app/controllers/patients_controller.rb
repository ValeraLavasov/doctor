class PatientsController < ApiController
  def index
    @patients = Patient.select("id, last_name, first_name").all
    render json: @patients.to_json
  end
end
