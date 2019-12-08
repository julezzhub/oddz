class ChangeDaysFromBets < ActiveRecord::Migration[5.2]
  def change
    change_column_default :bets, :premade_days, 0
  end
end
