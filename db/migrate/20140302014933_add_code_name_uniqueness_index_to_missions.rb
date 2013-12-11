class AddCodeNameUniquenessIndexToMissions < ActiveRecord::Migration
  def change
    add_index :missions, :code_name, unique: true
  end
end
