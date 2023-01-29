class Api::V1::CourtsController < Api::V1::BaseController
  def index
    courts = Court.where(state: "live")

    #filter court availability by type
    if params[:court_type].present?
      courts = courts.with_type(params[:court_type])
    end
    #filter court availability by date
    date = params[:date] || Time.now.to_date
    courts = courts.map{ |c| c.court_info(date) if c.reserved_play_hours(date).size < 24}

    #filter court availability by time
    if params[:time_slot].present?
      courts = courts.map{ |c| c if c[:available_hours].include?(params[:time_slot].to_i)}
    end

    render json: { data: { courts: courts }, status: :ok }
  end

  def show
    court = Court.find(params[:id])
    date = params[:date] || Time.now.to_date

    render json: { data: {court: court.court_info(date)}, status: :ok }
  end
end
