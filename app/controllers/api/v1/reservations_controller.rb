class Api::V1::ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all.order("created_at DESC")
    render json: @reservations 
  end

  def create
    @reservations = @reservations.create(reservation_param)
    render json: @reservations
  end

  def destroy
  end

  private
  def reservation_param
    params.require(:reservations).permit(:reservation_date, :user_id,:event_id)
  end
end
