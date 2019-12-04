class RemoveDurationFromBets < ActiveRecord::Migration[5.2]
  def change
    remove_column :bets, :premade_duration, :integer
  end
end
