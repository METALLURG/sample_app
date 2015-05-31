class EventsController < ApplicationController
  # GET /events
  def index
    @events = Event.order(started_at: :asc)
  end

  # GET /events/:id
  def show
    @event = Event.find(params[:id])
  end
end
