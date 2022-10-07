class Api::V1::EventsController < ApplicationController
  def index
    events = Event.all
    render "api/events/index"
  end

  def show
    event = Event.find(params[:id])
    render "api/events/show"
  end

  def create
    @event = Event.new(event_params)
    if @event.after_save
        render "api/events/show"
    else
        render json: @event.error.full_messages, status: 422
    end

    def update
      @event = Event.find(params[:id])
      if @event.update_attributes(event_params)
        render "api/events/show"
      else
        render.json: @event.error.full_messages, status: 422
      end


end
