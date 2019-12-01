class CreateBets < ActiveRecord::Migration[5.2]
  def change
    create_table :bets do |t|
      t.boolean :premade
      t.string :target
      t.string :metric
      t.integer :metric_count
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :status
      t.references :user, foreign_key: true
      t.references :friend, foreign_key: { to_table: 'users' }
      t.references :winner, foreign_key: { to_table: 'users' }
      t.timestamps
    end

    # add_index :bets, :friend_id
    # add_index :bets, :winner_id
  end
end
