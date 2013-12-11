class SplitNameIntoFirstNameAndLastNameForAgents < ActiveRecord::Migration
  def change
    change_table :agents do |t|
      t.rename :name, :first_name
      t.string :last_name
    end
  end
end
