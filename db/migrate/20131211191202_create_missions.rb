class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.string :code_name
      t.text :description
      t.timestamp :started_at
      t.timestamp :completed_at

      t.timestamps
    end
  end
end
