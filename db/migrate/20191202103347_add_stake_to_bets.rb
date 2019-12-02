class AddStakeToBets < ActiveRecord::Migration[5.2]
  def change
    add_monetize :bets, :stake, currency: { present: false }
  end
end
