class AddAliasNameToAgents < ActiveRecord::Migration
  def change
    add_column :agents, :alias_name, :string
  end
end
