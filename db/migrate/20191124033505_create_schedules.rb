class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.string :content
      t.integer :time
      t.integer :userid

      t.timestamps
    end
  end
end
