class Api::V1::ReservationsController < ApplicationController
  def index
    @reservations = User.find(params[:user_id]).reservations.order('created_at DESC')
    @reservations_list = []
    @reservations.each do |res|
      @reservations_list << { reservation: res, event: Event.find(res.event_id) }
    end
    render json: { reservation: @reservations_list }
  end

  def create
    @reservation = Reservation.create(reservation_param)
    if @reservation.save
      render json: { message: 'Reservation was created' }
    else
      render json: { message: 'reservation could not be created , try again !' }, status: :unauthorized
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    Reservation.destroy_by(id: params[:id])
    if @reservation.destroy
      render json: { message: 'Reservation Destroyed succefuly !' }
    else
      render json: { error: 401, message: ' Operation did not succeed!' }
    end
  end

  private

  def reservation_param
    params.permit(:reservation_date, :user_id, :event_id)
  end
end
