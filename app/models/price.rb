class Price < ActiveRecord::Base
  belongs_to :event, inverse_of: :prices

  validates :event, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :valid_till, presence: true
  validates :valid_till, uniqueness: { scope: :event_id }
end
