class EventsController < ApplicationController
  def index
    @events = Event.order(started_at: :desc)
  end

  def show
    @event = Event.find(params[:id])
  end
end
