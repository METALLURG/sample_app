class Registration < ActiveRecord::Base
  include Workflow

  belongs_to :user
  belongs_to :event

  has_many :payments, dependent: :destroy, inverse_of: :registration
  accepts_nested_attributes_for :payments, allow_destroy: true

  validates :user, presence: true
  validates :event, presence: true
  validates :user_id, uniqueness: { scope: :event_id }

  workflow do
    state :pending do
      event :approve, transitions_to: :approved
    end
    state :approved
  end

  def total_payments_amount
    payments.sum(:amount)
  end

  def recalculate_payments
    if pending? && total_payments_amount >= event.prepay_price
      approve!
    end
  end

  private

    def approve
      update_attributes(approved_at: Time.now, price: event.current_price.try(:price))
    end
end
