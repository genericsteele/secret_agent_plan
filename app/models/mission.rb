class Mission < ActiveRecord::Base
  validates :code_name, :description, presence: true
  validates :code_name, uniqueness: true
  validates :status, presence: true, inclusion:
    { in: %w(pending active completed failed),
      message: "%{value} is not a valid mission status" }
  belongs_to :agent
  scope :active, -> { where(status: 'active') }

  def active?
    status == 'active'
  end
end
