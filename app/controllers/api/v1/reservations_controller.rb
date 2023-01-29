class Api::V1::ReservationsController < Api::V1::BaseController
  before_action :set_reservation, only: [:show, :update, :destroy]

  def index
    @reservations = @user.reservations

    render json: { data: {reservations: @reservations.to_json(:except => [:created_at, :updated_at])}, status: :ok }
  end

  def show
  end

  def create
    court = Court.find(reservation_params[:court_id])
    resv_date =  reservation_params[:play_date]
    resv_slots = JSON.parse(reservation_params[:play_hours])

    intersected_hours = court.reserved_play_hours(resv_date) & resv_slots

    if intersected_hours.empty?
      @reservation = @user.reservations.build(reservation_params.except(:play_hours))
      if @reservation.save
        availability = @reservation.build_court_availability(court_id: court.id, date_slot: resv_date, time_slots: resv_slots)
        availability.save
        # NOTE: send reservation confirmation notification

        render json: { message: "successfully reserved"}, status: :ok
      else
        render json: { message: @reservation.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { message: "Time slot/s already reserved" }, status: :unprocessable_entity
    end
  end

  def update
    if @reservation.update(reservation_params.except(:play_hours))
      render json: { message: "successfully updated"}, status: :ok
    else
      render json: { message: @reservation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @user.reservations.exists?(@reservation.id)
      @reservation.destroy
      render json: { message: "Booking successfully deleted"}, status: :ok
    else
      render json: { message: "Couldn\'t delete booking!!!" }, status: :unprocessable_entity
    end
  end

  private

    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    def reservation_params
      params.require(:reservation).permit(:play_date, :court_id, :note, :play_hours)
    end
end
