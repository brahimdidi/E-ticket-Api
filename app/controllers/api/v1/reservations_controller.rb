class Api::V1::ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all.order("created_at DESC")
    render json: @reservations 
  end

  def create
    @reservations = Todo.create(todo_param)
    render json: @reservations
  end

  def destroy
  end

  private
  def reservation_param
    params.require(:todo).permit(:title, :done)
  end
end
