class AddPremadeHoursToBets < ActiveRecord::Migration[5.2]
  def change
    add_column :bets, :premade_hours, :integer
  end
end
