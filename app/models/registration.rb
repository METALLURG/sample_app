class Registration < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  validates :user, presence: true
  validates :event, presence: true
  validates :user_id, uniqueness: { scope: :event_id }

  before_validation :set_default_values

  private

    def set_default_values
      self.workflow_state ||= 'pending'
    end
end
