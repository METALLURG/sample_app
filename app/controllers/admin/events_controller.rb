class Admin::EventsController < Admin::BaseController
  before_action :set_event, only: [:edit, :update, :destroy]

  # GET /admin/events
  def index
    @events = Event.order(id: :asc)
  end

  # GET /admin/events/new
  def new
    @event = Event.new
  end

  # POST /admin/events
  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to admin_events_url, notice: I18n.t('shared.created')
    else
      render :new
    end
  end

  # GET /admin/events/:id/edit
  def edit
  end

  # PATCH/PUT /admin/events/:id
  def update
    if @event.update_attributes(event_params)
      redirect_to admin_events_url, notice: I18n.t('shared.saved')
    else
      render :edit
    end
  end

  # DELETE /admin/events/:id
  def destroy
    if @event.destroy
      redirect_to admin_events_url, notice: I18n.t('shared.destroyed')
    else
      redirect_to admin_events_url, alert: I18n.t('shared.not_destroyed')
    end
  end

  private

    def event_params
      params.require(:event).permit(:user_id, :event_template_id, :city, :started_at, :finished_at, :prepay_price, prices_attributes: [:id, :price, :valid_till, :_destroy])
    end

    def set_event
      @event = Event.find(params[:id])
    end
end
