class Payment < ActiveRecord::Base
  belongs_to :registration, inverse_of: :payments

  validates :registration, presence: true
  validates :amount, presence: true

  after_create :recalculate_payments

  private

    def recalculate_payments
      registration.recalculate_payments
    end
end
