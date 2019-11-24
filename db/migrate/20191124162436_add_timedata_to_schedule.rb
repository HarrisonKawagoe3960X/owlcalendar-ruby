class AddTimedataToSchedule < ActiveRecord::Migration[6.0]
  def change
    add_column :schedules, :timedata, :string
  end
end
