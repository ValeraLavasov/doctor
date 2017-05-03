class AppointmentsController < ApiController
  def index
    @appointment = Appointment.select("id, last_name, first_name").all
    render json: @patients.to_json, status: 200
  end

  def show
    fetch_appointment
    # Not sure about this render mb just simple to_json
    render json: @appointment.to_json(include: { medical_doctors: { 
                                      only: :id }, patients: { only: :id } }), status: 200
  end

  # TODO: add better error handling and responses

  def create
    @appointment = Appointment.create(params)
    render json: @appointment.to_json, status: 201
  end

  def approve
    fetch_appointment
    @appointment.approve!
    head :ok
  end

  def decline
    fetch_appointment
    @appointment.decline!
    head :ok
  end

  def cancel
    fetch_appointment
    @appointment.cancel!
    head :ok
  end

  private

  def fetch_appointment
    @appointment = Appointment.find(params[:id])    
  end
end
