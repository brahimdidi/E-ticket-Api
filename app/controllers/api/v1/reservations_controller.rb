class Api::V1::ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all.order("created_at DESC")
    render json: @reservations 
  end

  def create
    @reservations = @reservations.create(reservation_param)
    if @reservation.save
      render json: { message: 'Reservation was created' }
    else
      render json: { message: 'reservation could not be created , try again !' }, status: :unauthorized
    end
  end

  def destroy
  end

  private
  def reservation_param
    params.require(:reservations).permit(:reservation_date, :user_id,:event_id)
  end
end
