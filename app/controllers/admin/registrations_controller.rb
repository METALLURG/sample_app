class Admin::RegistrationsController < Admin::BaseController
  before_action :set_event

  # GET /admin/events/:event_id/registrations
  def index
    @registrations = @event.registrations.order(created_at: :desc)
  end

  private

    def set_event
      @event = Event.find(params[:event_id])
    end
end
