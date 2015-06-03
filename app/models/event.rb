class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :event_template

  has_many :prices, dependent: :destroy, inverse_of: :event
  accepts_nested_attributes_for :prices, allow_destroy: true

  validates :user, presence: true
  validates :event_template, presence: true
  validates :name, presence: true
  validates :city, presence: true
  validates :started_at, presence: true
  validates :finished_at, presence: true
  validates :prepay_price, presence: true, numericality: { greater_than: 0}
  validates :content, presence: true

  before_validation :set_default_values

  delegate :name, :content, to: :event_template

  def set_default_values
    self.user ||= User.where(admin: true).first
  end
end
