class Agent < ActiveRecord::Base
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
  has_many :missions
  scope :on_assignment, -> { Agent.joins(:missions).where(missions: { status: 'active' }) }
  scope :not_on_assignment, -> { where.not(id: Agent.on_assignment.pluck(:id)) }

  def name
    "#{first_name} #{last_name}"
  end

  def on_assignment?
    missions.active.any?
  end
end
