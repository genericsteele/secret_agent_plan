class DropDatesFromMissions < ActiveRecord::Migration
  def up
    change_table :missions do |t|
      t.remove :started_at, :completed_at
    end
  end

  def down
    change_table :missions do |t|
      t.datetime :started_at
      t.datetime :completed_at
    end
  end
end
