class Api::V1::EventsController < ApplicationController
  def index
    @events = Event.all
    render json: @events
  end

  def show
    @event = Event.find(params[:id])
    render json: @event
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      render json: { message: 'Event created succefuly!' }
    else
      render json: { error: 401, message: ' event cannot be processed !' }
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      render json: { message: "#{@event.name} Event updated succefuly" }
    else
      render json: { error: 401, message: ' Operation did not succeed!' }
    end
  end

  def destroy
    @event = Event.find(params[:id])
    Event.destroy_by(id: params[:id])
    if @event.destroy
      render json: { message: "#{@event.name} Destroyed succefuly !" }
    else
      render json: { error: 401, message: ' Operation did not succeed!' }
    end
  end

  private

  def event_params
    params.require(:event).permit(
      :name,
      :description,
      :event_date,
      :photo,
      :location,
      :ticket_price,
      :seats_available
    )
  end
end
