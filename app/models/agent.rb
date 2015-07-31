class Agent < ActiveRecord::Base
  has_many :missions
  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  scope :on_assignment, -> { Agent.joins(:missions).where(missions: { status: "active" }) }
  scope :not_on_assignment, -> { where.not(id: Agent.on_assignment.pluck(:id)) }

  def name
    "#{first_name} #{last_name}"
  end

  def on_assignment?
    missions.active.any?
  end
end
