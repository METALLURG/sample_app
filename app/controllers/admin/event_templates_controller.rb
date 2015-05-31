class Admin::EventTemplatesController < Admin::BaseController
  before_action :set_event_template, only: [:edit, :update, :destroy]

  # GET /admin/event_templates
  def index
    @event_templates = EventTemplate.order(id: :asc)
  end

  # GET /admin/event_templates/new
  def new
    @event_template = EventTemplate.new
  end

  # POST /admin/event_templates
  def create
    @event_template = EventTemplate.new(event_template_params)
    if @event_template.save
      redirect_to admin_event_templates_url, notice: I18n.t('shared.created')
    else
      render :new
    end
  end

  # GET /admin/event_templates/:id/edit
  def edit
  end

  # PATCH/PUT /admin/event_templates/:id
  def update
    if @event_template.update_attributes(event_template_params)
      redirect_to admin_event_templates_url, notice: I18n.t('shared.saved')
    else
      render :edit
    end
  end

  # DELETE /admin/event_templates/:id
  def destroy
    if @event_template.destroy
      redirect_to admin_event_templates_url, notice: I18n.t('shared.destroyed')
    else
      redirect_to admin_event_templates_url, alert: I18n.t('shared.not_destroyed')
    end
  end

  private

    def event_template_params
      params.require(:event_template).permit(:user_id, :name, :city, :started_at, :finished_at, :prepay_price, :content)
    end

    def set_event_template
      @event_template = EventTemplate.find(params[:id])
    end
end
