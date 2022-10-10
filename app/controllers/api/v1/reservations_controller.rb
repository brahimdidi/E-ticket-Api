class Api::V1::ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all.order("created_at DESC")
    render json: @reservations 
  end

  def create
  end

  def update
  end

  def destroy
  end
end
