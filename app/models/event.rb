class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :event_template

  has_many :prices, dependent: :destroy, inverse_of: :event
  accepts_nested_attributes_for :prices, allow_destroy: true

  has_many :registrations, dependent: :restrict_with_error

  validates :user, presence: true
  validates :event_template, presence: true
  validates :city, presence: true
  validates :started_at, presence: true
  validates :finished_at, presence: true
  validates :prepay_price, presence: true, numericality: { greater_than: 0}

  before_validation :set_default_values

  delegate :name, :content, to: :event_template

  def set_default_values
    self.user ||= User.where(admin: true).first
  end

  def current_price
    prices.where('prices.valid_till >= ?', Date.today).order(valid_till: :asc).limit(1).first || prices.order(valid_till: :asc).last
  end
end
