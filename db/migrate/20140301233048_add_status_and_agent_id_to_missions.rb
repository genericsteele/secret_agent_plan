class AddStatusAndAgentIdToMissions < ActiveRecord::Migration
  def change
    add_column :missions, :status, :string, default: 'pending'
    add_column :missions, :agent_id, :integer
  end
end
