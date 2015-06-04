class RegistrationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event

  # POST /events/:event_id/registrations
  def create
    @registration = current_user.registrations.build(event: @event)
    if @registration.save
      # render default template
    else
      redirect_to event_url(@event), alert: 'Произошла ошибка при регистрации'
    end
  end

  private

    def set_event
      @event = Event.find(params[:event_id])
    end
end
