class ChangeHoursFromBets < ActiveRecord::Migration[5.2]
  def change
    change_column_default :bets, :premade_hours, 0
  end
end
