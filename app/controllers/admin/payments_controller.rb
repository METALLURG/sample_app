class Admin::PaymentsController < Admin::BaseController
  before_action :set_registration

  # GET /admin/registrations/:registration_id/payments
  def index
    @payments = @registration.payments.order(created_at: :asc)
  end

  # GET /admin/registrations/:registration_id/payments/new
  def new
    @payment = @registration.payments.build
  end

  # POST /admin/registrations/:registration_id/payments
  def create
    @payment = @registration.payments.build(payment_params)
    if @payment.save
      redirect_to admin_registration_payments_url(@registration), notice: 'Платеж добавлен'
    else
      render :new
    end
  end

  private

    def set_registration
      @registration ||= Registration.find(params[:registration_id])
    end

    def payment_params
      params.require(:payment).permit(:amount)
    end
end
