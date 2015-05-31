class Event < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true
  validates :name, presence: true
  validates :city, presence: true
  validates :started_at, presence: true
  validates :finished_at, presence: true
  validates :prepay_price, presence: true, numericality: { greater_than: 0}
  validates :content, presence: true

  before_validation :set_default_values

  def set_default_values
    self.user ||= User.where(admin: true).first
  end
end