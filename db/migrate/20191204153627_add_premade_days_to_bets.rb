class AddPremadeDaysToBets < ActiveRecord::Migration[5.2]
  def change
    add_column :bets, :premade_days, :integer
  end
end
