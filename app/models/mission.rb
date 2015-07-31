class Mission < ActiveRecord::Base
  STATUSES = %w(pending active completed failed)
  belongs_to :agent
  validates :code_name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :status, inclusion: { in: STATUSES, message: "%{value} is not a valid mission status" }

  def self.active
    where(status: "active")
  end

  def active?
    status == "active"
  end
end
