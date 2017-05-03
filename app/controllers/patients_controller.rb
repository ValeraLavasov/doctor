class PatientsController < ApiController
  class SignInError < StandardError; end
  class SignUpError < StandardError; end
  
  def index
    @patients = Patient.select("id, last_name, first_name").all
    render json: @patients.to_json, status: 200
  end

  def show
    @patient = Patient.find(params[:id])
    render json: @patient.to_json(include: { appointments: { 
                                  only: %i(id aasm_state comment) } }), status: 200
  end

  # TODO: Need some way to identify front end that it is mine
  def signup
    @patient = ::Patient.new(params[:patient])
    raise SignInError unless valid_for_signin?(@patient)
    render json: @patient.to_json, status: 201   
  end

  def signin
    @patient = ::Patient.find_for_database_authentication(email: params.dig(:patient, :email)
    raise SignUpError, @patient.errors.full_messages unless @patient.save
    render json: @patient.to_json, status: 200
  end

  private

  def valid_for_signin?(patient)
    patient&.valid_password?(params.dig(:patient, :password))
  end
end
